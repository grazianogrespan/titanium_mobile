/**
 * Appcelerator Titanium Mobile
 * Copyright (c) 2011-2016 by Appcelerator, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#include "AndroidUtil.h"
#include "EventEmitter.h"
#include "JavaObject.h"
#include "JNIUtil.h"
#include "ReferenceTable.h"

#include <v8.h>

using namespace v8;

#define TAG "JavaObject"

namespace titanium {

bool JavaObject::useGlobalRefs = true;

static jobject objectMap;

#ifdef TI_DEBUG
static struct {
	int total;
	int detached;
} stats = {0, 0};

#define UPDATE_STATS(_total, _detached) \
	stats.total += _total; \
	stats.detached += _detached; \
	LOGD(TAG, ">>> JavaObject: total=%i detached=%i <<<", stats.total, stats.detached);
#else
#define UPDATE_STATS(total, detached)
#endif

// Callback for V8 letting us know the JavaScript object is no longer reachable.
// Once we receive this callback we can safely release our strong reference
// on the wrapped Java object so it can become eligible for collection.
static void DetachCallback(const v8::WeakCallbackData<v8::Object, JavaObject>& data)
{
	JavaObject* javaObject = data.GetParameter();
	javaObject->detach();
}

JavaObject::JavaObject(jobject javaObject)
	: EventEmitter()
	, javaObject_(NULL)
	, refTableKey_(0)
	, isWeakRef_(false)
{
	UPDATE_STATS(1, 1);

	if (javaObject) {
		attach(javaObject);
	}
}

// Create a strong reference to the wrapped Java object
// to prevent it from becoming garbage collected by Dalvik.
void JavaObject::newGlobalRef()
{
	JNIEnv *env = JNIUtil::getJNIEnv();
	ASSERT(env != NULL);

	if (useGlobalRefs) {
		ASSERT(javaObject_ != NULL);
		jobject globalRef = env->NewGlobalRef(javaObject_);
		if (isWeakRef_) {
			env->DeleteWeakGlobalRef(javaObject_);
			isWeakRef_ = false;
		}
		javaObject_ = globalRef;
	} else {
		ASSERT(refTableKey_ == 0); // make sure we haven't already stored something
		refTableKey_ = ReferenceTable::createReference(javaObject_); // make strong ref on Java side
		javaObject_ = NULL; // toss out the java object copy here, it's in ReferenceTable's HashMap
	}
}

// Returns a global reference to the wrapped Java object.
// If the object has become "detached" this will re-attach
// it to ensure the Java object will not get collected.
jobject JavaObject::getJavaObject()
{
	if (useGlobalRefs) {
		ASSERT(javaObject_ != NULL);

		// We must always return a valid Java proxy reference.
		// Otherwise we risk crashing in the calling code.
		// If we are "detached" we will re-attach whenever the Java
		// proxy is requested.
		if (isDetached()) {
			attach(NULL);
		}

		return javaObject_;
	} else {
		if (isWeakRef_) { // Did JS side try to collect our object already?
			// OH SNAP, DON'T KILL OUR OBJECT YET JVM!
			// make reference strong again on Java side if we can...
			jobject javaObject = ReferenceTable::clearWeakReference(refTableKey_);
			UPDATE_STATS(0, -1);
			if (javaObject == NULL) {
				// SHIT! Java collected it. ummmm, not much we can do here.
				// Maybe we can... Nope. It's gone. Live with it.
				LOGE(TAG, "Java object reference has been invalidated.");
			}

			isWeakRef_ = false; // not weak on Java side anymore

			// tell V8 to let us know when it thinks the JS object can be collected again
			persistent().SetWeak(this, DetachCallback);
			persistent().MarkIndependent();

			return javaObject;
		}
		return ReferenceTable::getReference(refTableKey_);
	}
}

// Convert our strong reference to the Java object into a weak
// reference to allow it to become eligible for collection by Dalvik.
// This typically happens once V8 has detected the JavaScript object
// that wraps the Java object is no longer reachable.
void JavaObject::weakGlobalRef()
{
	JNIEnv *env = JNIUtil::getJNIEnv();
	ASSERT(env != NULL);

	if (useGlobalRefs) {
		ASSERT(javaObject_ != NULL);
		jweak weakRef = env->NewWeakGlobalRef(javaObject_);
		env->DeleteGlobalRef(javaObject_);
		javaObject_ = weakRef;
	} else {
		// Make our strong reference weak on Java side
		// Dead man walking
		ReferenceTable::makeWeakReference(refTableKey_);
	}

	isWeakRef_ = true; // remember that our ref on Java side is weak
}

// Deletes the reference to the wrapped Java object.
// This should only happen once this object is no longer
// needed and about to be deleted.
void JavaObject::deleteGlobalRef()
{
	JNIEnv *env = JNIUtil::getJNIEnv();
	ASSERT(env != NULL);

	if (useGlobalRefs) {
		ASSERT(javaObject_ != NULL);
		if (isWeakRef_) {
			env->DeleteWeakGlobalRef(javaObject_);
		} else {
			env->DeleteGlobalRef(javaObject_);
		}
		javaObject_ = NULL;
	} else {
		ReferenceTable::destroyReference(refTableKey_); // Kill the Java side
		refTableKey_ = 0; // throw away the key
	}
}

JavaObject::~JavaObject()
{
	UPDATE_STATS(-1, isDetached() ? -1 : 0);

	if (javaObject_ || refTableKey_ > 0) {
		deleteGlobalRef();
	}

	if (persistent().IsEmpty())
		return;
	assert(persistent().IsNearDeath());
	persistent().ClearWeak();
	persistent().Reset();
}

void JavaObject::wrap(Isolate* isolate, Local<Object> jsObject)
{
	ASSERT(persistent().IsEmpty());
	ASSERT(jsObject->InternalFieldCount() > 0);
	jsObject->SetAlignedPointerInInternalField(0, this);
	persistent().Reset(isolate, jsObject);
}

// Attaches the Java object to this native wrapper.
// This wrapper will create a global reference to the
// Java object and keep it from becoming collected by Dalvik
// until it is detached or made weak (weakGlobalRef()).
void JavaObject::attach(jobject javaObject)
{
	ASSERT((javaObject && javaObject_ == NULL) || javaObject == NULL);
	UPDATE_STATS(0, -1);

	if (javaObject) {
		javaObject_ = javaObject;
	}
	// make strong ref to Java object in JVM
	newGlobalRef();

	// So let's mark this JS object as independent and weak so V8 can tell us
	// when the JS object is ready to be GCed, which is first step in it's death
	persistent().SetWeak(this, DetachCallback);
	persistent().MarkIndependent();
}

void JavaObject::detach()
{
	// WAIT A SECOND V8!!! DON'T KILL MY OBJECT YET! THE JVM MAY STILL WANT IT!
	persistent().ClearWeak();

	if (isDetached()) {
		return;
	}

	// V8 says we don't need the object on the JS side
	// Let's make the object weak in the JVM now...
	UPDATE_STATS(0, 1);
	weakGlobalRef();
}

bool JavaObject::isDetached()
{
	return (javaObject_ == NULL && refTableKey_ == 0) || isWeakRef_;
}

<<<<<<< HEAD
void JavaObject::MakeJavaStrong()
{
	if (useGlobalRefs) {
		ASSERT(javaObject_ != NULL);
		JNIEnv *env = JNIUtil::getJNIEnv();
		ASSERT(env != NULL);
		jobject globalRef = env->NewGlobalRef(javaObject_);
		if (isWeakRef_) { // if we're going from weak back to strong...
			env->DeleteWeakGlobalRef(javaObject_); // delete the weak ref we had
		}
		javaObject_ = globalRef;

		// When we're done we should always have an object, but no key
		ASSERT(refTableKey_ == 0);
		ASSERT(javaObject_ != NULL);
	} else {
		if (isWeakRef_) { // if we are weak, upgrade back to strong
			// Make sure we have a key
			ASSERT(refTableKey_ != 0);
			JNIEnv *env = JNIUtil::getJNIEnv();
			ASSERT(env != NULL);
			jobject stored = ReferenceTable::clearWeakReference(refTableKey_);
			if (stored == NULL) {
				// Sanity check. Did we get into a state where it was weak on Java, got GC'd but the C++ proxy didn't get deleted yet?
				LOGE(TAG, "!!! OH NO! We tried to move a weak Java object back to strong, but it's aleady been GC'd by JVM! We're in a bad state! Key: %d", refTableKey_);
			}
			env->DeleteLocalRef(stored);
		} else {
			// New entry, make sure we have no key, have an object, get a new key
			ASSERT(javaObject_ != NULL);
			ASSERT(refTableKey_ == 0); // make sure we haven't already stored something
			refTableKey_ = ReferenceTable::createReference(javaObject_); // make strong ref on Java side
			javaObject_ = NULL; // toss out the java object copy here, it's in ReferenceTable's HashMap
		}
		// When we're done we should always have a reference key, but no object
		ASSERT(refTableKey_ != 0);
		ASSERT(javaObject_ == NULL);
	}
	// no longer a weak reference
	isWeakRef_ = false;
	UPDATE_STATS(0, -1); // one less detached
}

void JavaObject::MakeJavaWeak()
{
	// Make sure we're not trying to make a weak reference weak again!
	ASSERT(!isWeakRef_);
	if (useGlobalRefs) {
		JNIEnv *env = JNIUtil::getJNIEnv();
		ASSERT(env != NULL);
		ASSERT(javaObject_ != NULL);
		// Convert our global ref to a weak global ref
		jweak weakRef = env->NewWeakGlobalRef(javaObject_);
		env->DeleteGlobalRef(javaObject_);
		javaObject_ = weakRef;
	} else {
		ASSERT(refTableKey_ != 0);
		ReferenceTable::makeWeakReference(refTableKey_);
	}

	UPDATE_STATS(0, 1); // add one to "detached" counter
	isWeakRef_ = true; // remember that our ref on Java side is weak
}

void JavaObject::DeleteJavaRef()
{
	if (useGlobalRefs) {
		LOGD(TAG, "Deleting global ref");
		JNIEnv *env = JNIUtil::getJNIEnv();
		ASSERT(env != NULL);
		ASSERT(javaObject_ != NULL);
		// Wipe the V8Object ptr value back to 0, to denote that the native C++ proxy is gone
		JNIUtil::removePointer(javaObject_);
		if (isWeakRef_) {
			env->DeleteWeakGlobalRef(javaObject_);
		} else {
			env->DeleteGlobalRef(javaObject_);
		}
		javaObject_ = NULL;
	} else {
		LOGD(TAG, "Deleting ref in ReferenceTable for key: %d, pointer: %p", refTableKey_, this);
		ReferenceTable::destroyReference(refTableKey_); // Kill the Java side
		refTableKey_ = 0; // throw away the key
	}
	// When we're done we should be wrapping nothing!
	ASSERT(javaObject_ == NULL);
	ASSERT(refTableKey_ == 0);
}

=======
>>>>>>> 8d03624a669338ceab837242c6fefd23c1b1380f
}

/**
 * Appcelerator Titanium Mobile
 * Copyright (c) 2017-Present by Appcelerator, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */
#if defined(USE_TI_UIIOSTOOLBAR) || defined(USE_TI_UITOOLBAR)

#import "TiUIToolbarProxy.h"
#import "TiUIToolbar.h"

@implementation TiUIToolbarProxy

USE_VIEW_FOR_VERIFY_HEIGHT

- (UIViewAutoresizing)verifyAutoresizing:(UIViewAutoresizing)suggestedResizing
{
<<<<<<< HEAD
  return suggestedResizing & ~UIViewAutoresizingFlexibleHeight;
=======
    return suggestedResizing & ~UIViewAutoresizingFlexibleHeight;
>>>>>>> d66b03e449579adc243c52d3139083cf16a80604
}

- (id)_initWithPageContext:(id<TiEvaluator>)context_ args:(NSArray *)args apiName:(NSString *)apiName
{
<<<<<<< HEAD
  if (self = [super _initWithPageContext:context_ args:args]) {
    _apiName = [apiName retain];
  }

  return self;
=======
    if (self = [super _initWithPageContext:context_ args:args]) {
        _apiName = [apiName retain];
    }
    
    return self;
>>>>>>> d66b03e449579adc243c52d3139083cf16a80604
}

- (void)dealloc
{
<<<<<<< HEAD
  RELEASE_TO_NIL(_apiName);
  [super dealloc];
=======
    RELEASE_TO_NIL(_apiName);
    [super dealloc];
>>>>>>> d66b03e449579adc243c52d3139083cf16a80604
}

- (NSString *)apiName
{
<<<<<<< HEAD
  return _apiName;
=======
    return _apiName;
>>>>>>> d66b03e449579adc243c52d3139083cf16a80604
}

- (UIToolbar *)toolbar
{
<<<<<<< HEAD
  TiUIToolbar *theview = (TiUIToolbar *)[self view];
  return [theview toolBar];
=======
    TiUIToolbar *theview = (TiUIToolbar *)[self view];
    return [theview toolBar];
>>>>>>> d66b03e449579adc243c52d3139083cf16a80604
}

- (void)setItems:(NSArray *)newItems
{
<<<<<<< HEAD
  NSArray *oldItems = [self valueForUndefinedKey:@"items"];
  if (![oldItems isKindOfClass:[NSArray class]]) {
    oldItems = nil;
  }

  BOOL newItemsIsArray = [newItems isKindOfClass:[NSArray class]];
  if (newItemsIsArray) {
    for (TiViewProxy *currentItem in newItems) {
      if (![currentItem respondsToSelector:@selector(supportsNavBarPositioning)] || ![currentItem supportsNavBarPositioning]) {
        NSString *errorString = [NSString stringWithFormat:@"%@ does not support being in a toolbar!", currentItem];
        [self throwException:errorString subreason:nil location:CODELOCATION];
        /*
=======
    NSArray *oldItems = [self valueForUndefinedKey:@"items"];
    if (![oldItems isKindOfClass:[NSArray class]]) {
        oldItems = nil;
    }

    BOOL newItemsIsArray = [newItems isKindOfClass:[NSArray class]];
    if (newItemsIsArray) {
        for (TiViewProxy *currentItem in newItems) {
            if (![currentItem respondsToSelector:@selector(supportsNavBarPositioning)] || ![currentItem supportsNavBarPositioning]) {
                NSString* errorString = [NSString stringWithFormat:@"%@ does not support being in a toolbar!", currentItem];
                [self throwException:errorString subreason:nil location:CODELOCATION];
                /*
>>>>>>> d66b03e449579adc243c52d3139083cf16a80604
				 *	Note that this theoretically could mean proxies are improperly remembered
				 *	if a later entry causes this exception to be thrown. However, the javascript
				 *	should NOT be using nonproxy objects and the onus is on the Javascript
				 */
<<<<<<< HEAD
      }

      if (![oldItems containsObject:currentItem]) {
        [self rememberProxy:currentItem];
      }
    }
  }
  for (TiViewProxy *currentItem in oldItems) {
    if (newItemsIsArray && [newItems containsObject:currentItem]) {
      continue;
    }
    [self forgetProxy:currentItem];
  }
  [self replaceValue:newItems forKey:@"items" notification:YES];
=======
            }

            if (![oldItems containsObject:currentItem]) {
                [self rememberProxy:currentItem];
            }
        }
    }
    for (TiViewProxy *currentItem in oldItems) {
        if (newItemsIsArray && [newItems containsObject:currentItem]) {
            continue;
        }
        [self forgetProxy:currentItem];
    }
    [self replaceValue:newItems forKey:@"items" notification:YES];
>>>>>>> d66b03e449579adc243c52d3139083cf16a80604
}

- (TiDimension)defaultAutoHeightBehavior:(id)unused
{
<<<<<<< HEAD
  return TiDimensionAutoSize;
=======
    return TiDimensionAutoSize;
>>>>>>> d66b03e449579adc243c52d3139083cf16a80604
}

@end

#endif

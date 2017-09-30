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
>>>>>>> 8d03624a669338ceab837242c6fefd23c1b1380f
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
>>>>>>> 8d03624a669338ceab837242c6fefd23c1b1380f
}

- (void)dealloc
{
<<<<<<< HEAD
  RELEASE_TO_NIL(_apiName);
  [super dealloc];
=======
    RELEASE_TO_NIL(_apiName);
    [super dealloc];
>>>>>>> 8d03624a669338ceab837242c6fefd23c1b1380f
}

- (NSString *)apiName
{
<<<<<<< HEAD
  return _apiName;
=======
    return _apiName;
>>>>>>> 8d03624a669338ceab837242c6fefd23c1b1380f
}

- (UIToolbar *)toolbar
{
<<<<<<< HEAD
  TiUIToolbar *theview = (TiUIToolbar *)[self view];
  return [theview toolBar];
=======
    TiUIToolbar *theview = (TiUIToolbar *)[self view];
    return [theview toolBar];
>>>>>>> 8d03624a669338ceab837242c6fefd23c1b1380f
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
>>>>>>> 8d03624a669338ceab837242c6fefd23c1b1380f
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
>>>>>>> 8d03624a669338ceab837242c6fefd23c1b1380f
}

- (TiDimension)defaultAutoHeightBehavior:(id)unused
{
<<<<<<< HEAD
  return TiDimensionAutoSize;
=======
    return TiDimensionAutoSize;
>>>>>>> 8d03624a669338ceab837242c6fefd23c1b1380f
}

@end

#endif

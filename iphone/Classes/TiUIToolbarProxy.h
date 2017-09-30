/**
 * Appcelerator Titanium Mobile
 * Copyright (c) 2017-Present by Appcelerator, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */
#if defined(USE_TI_UIIOSTOOLBAR) || defined(USE_TI_UITOOLBAR)

#import "TiToolbar.h"
#import "TiViewProxy.h"

@interface TiUIToolbarProxy : TiViewProxy <TiToolbar> {
<<<<<<< HEAD
  @private
  NSString *_apiName;
=======
    @private
    NSString *_apiName;
>>>>>>> 8d03624a669338ceab837242c6fefd23c1b1380f
}

- (id)_initWithPageContext:(id<TiEvaluator>)context_ args:(NSArray *)args apiName:(NSString *)apiName;

@end

#endif

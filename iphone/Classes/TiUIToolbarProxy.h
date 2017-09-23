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
>>>>>>> d66b03e449579adc243c52d3139083cf16a80604
}

- (id)_initWithPageContext:(id<TiEvaluator>)context_ args:(NSArray *)args apiName:(NSString *)apiName;

@end

#endif

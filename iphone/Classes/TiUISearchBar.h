/**
 * Appcelerator Titanium Mobile
 * Copyright (c) 2009-2010 by Appcelerator, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */
#if defined(USE_TI_UITABLEVIEW) || defined(USE_TI_UILISTVIEW)
#ifndef USE_TI_UISEARCHBAR
#define USE_TI_UISEARCHBAR
#endif
#endif

#ifdef USE_TI_UISEARCHBAR

#import "TiUIView.h"

@interface TiUISearchBar : TiUIView <UISearchBarDelegate> {
  @private
  UISearchBar *searchView;
  CALayer *backgroundLayer;
  id<UISearchBarDelegate> delegate;
}

<<<<<<< HEAD
- (void)setDelegate:(id<UISearchBarDelegate>)delegate;
- (UISearchBar *)searchBar;
- (void)setSearchBar:(UISearchBar *)searchBar;
=======
-(void)setDelegate:(id<UISearchBarDelegate>)delegate;
-(UISearchBar*)searchBar;
-(void)setSearchBar:(UISearchBar *)searchBar;
>>>>>>> 8d03624a669338ceab837242c6fefd23c1b1380f

@end

#endif

/**
 * Appcelerator Titanium Mobile
 * Copyright (c) 2013 by Appcelerator, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */
#ifdef USE_TI_UILISTVIEW

#import "TiUIListViewProxy.h"
#import "TiUIView.h"

#if IS_XCODE_8
// Add support for iOS 10 table-view prefetching
<<<<<<< HEAD
@interface TiUIListView : TiUIView <UITableViewDelegate, UITableViewDataSource, UITableViewDataSourcePrefetching, UIScrollViewDelegate, UIGestureRecognizerDelegate, UISearchBarDelegate, UISearchResultsUpdating, UISearchControllerDelegate, TiScrolling, TiProxyObserver, TiUIListViewDelegateView>
=======
@interface TiUIListView : TiUIView <UITableViewDelegate, UITableViewDataSource, UITableViewDataSourcePrefetching, UIScrollViewDelegate, UIGestureRecognizerDelegate, UISearchBarDelegate,UISearchResultsUpdating, UISearchControllerDelegate, TiScrolling, TiProxyObserver, TiUIListViewDelegateView>
>>>>>>> 8d03624a669338ceab837242c6fefd23c1b1380f
#else
@interface TiUIListView : TiUIView <UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate, UIGestureRecognizerDelegate, UISearchBarDelegate, UISearchResultsUpdating, UISearchControllerDelegate, TiScrolling, TiProxyObserver, TiUIListViewDelegateView>
#endif

#pragma mark - Private APIs

@property (nonatomic, readonly) UITableView *tableView;
@property (nonatomic, readonly) BOOL isSearchActive;

- (void)setDictTemplates_:(id)args;
- (void)setContentOffset_:(id)value withObject:(id)args;
- (void)setContentInsets_:(id)value withObject:(id)props;
- (void)deselectAll:(BOOL)animated;
- (void)updateIndicesForVisibleRows;

+ (UITableViewRowAnimation)animationStyleForProperties:(NSDictionary *)properties;

@end

#endif

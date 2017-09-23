/**
 * Appcelerator Titanium Mobile
 * Copyright (c) 2009-Present by Appcelerator, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */
#if defined(USE_TI_UIIOSTOOLBAR) || defined(USE_TI_UITOOLBAR)

#import "TiUIToolbar.h"
#import "TiColor.h"
#import "TiToolbar.h"
#import "TiToolbarButton.h"
#import "TiUtils.h"
#import "TiViewProxy.h"

@implementation TiUIToolbar

#ifdef TI_USE_AUTOLAYOUT
- (void)initializeTiLayoutView
{
<<<<<<< HEAD
  [super initializeTiLayoutView];
  toolBar = [self toolBar];
  [self setDefaultHeight:TiDimensionAutoSize];
  [self setDefaultWidth:TiDimensionAutoFill];
=======
    [super initializeTiLayoutView];
    toolBar = [self toolBar];
    [self setDefaultHeight:TiDimensionAutoSize];
    [self setDefaultWidth:TiDimensionAutoFill];
>>>>>>> d66b03e449579adc243c52d3139083cf16a80604
}
#endif

- (void)dealloc
{
<<<<<<< HEAD
  [self performSelector:@selector(setItems_:) withObject:nil];
  RELEASE_TO_NIL(toolBar);
  [super dealloc];
=======
    [self performSelector:@selector(setItems_:) withObject:nil];
    RELEASE_TO_NIL(toolBar);
    [super dealloc];
>>>>>>> d66b03e449579adc243c52d3139083cf16a80604
}

- (UIToolbar *)toolBar
{
<<<<<<< HEAD
  if (toolBar == nil) {
    toolBar = [[UIToolbar alloc] initWithFrame:[self bounds]];
    [toolBar setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleBottomMargin];
    [self addSubview:toolBar];
    id extendVal = [[self proxy] valueForUndefinedKey:@"extendBackground"];
    extendsBackground = [TiUtils boolValue:extendVal def:NO];
    if (extendsBackground) {
      [toolBar setDelegate:(id<UIToolbarDelegate>)self];
      [self setClipsToBounds:NO];
      return toolBar;
    }
    [self setClipsToBounds:YES];
  }
  return toolBar;
=======
    if (toolBar == nil) {
        toolBar = [[UIToolbar alloc] initWithFrame:[self bounds]];
        [toolBar setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleBottomMargin];
        [self addSubview:toolBar];
        id extendVal = [[self proxy] valueForUndefinedKey:@"extendBackground"];
        extendsBackground = [TiUtils boolValue:extendVal def:NO];
        if (extendsBackground) {
            [toolBar setDelegate:(id<UIToolbarDelegate>)self];
            [self setClipsToBounds:NO];
            return toolBar;
        }
        [self setClipsToBounds:YES];
    }
    return toolBar;
>>>>>>> d66b03e449579adc243c52d3139083cf16a80604
}

- (NSInteger)positionForBar:(id)bar
{
<<<<<<< HEAD
  if (extendsBackground) {
#ifndef TI_USE_AUTOLAYOUT
#if defined(DEBUG) || defined(DEVELOPER)
    TiDimension myTop = ((TiViewProxy *)[self proxy]).layoutProperties->top;
    if (!TiDimensionEqual(myTop, TiDimensionMake(TiDimensionTypeDip, 20))) {
      NSLog(@"extendBackground is true but top is not 20");
    }
#endif
#endif
    return UIBarPositionTopAttached;
  }
  return UIBarPositionAny;
=======
    if (extendsBackground) {
#ifndef TI_USE_AUTOLAYOUT
#if defined(DEBUG) || defined(DEVELOPER)
        TiDimension myTop = ((TiViewProxy *)[self proxy]).layoutProperties->top;
        if (!TiDimensionEqual(myTop, TiDimensionMake(TiDimensionTypeDip, 20))) {
            NSLog(@"extendBackground is true but top is not 20");
        }
#endif
#endif
        return UIBarPositionTopAttached;
    }
    return UIBarPositionAny;
>>>>>>> d66b03e449579adc243c52d3139083cf16a80604
}

- (id)accessibilityElement
{
<<<<<<< HEAD
  return [self toolBar];
=======
    return [self toolBar];
>>>>>>> d66b03e449579adc243c52d3139083cf16a80604
}

#ifndef TI_USE_AUTOLAYOUT
- (void)layoutSubviews
{
<<<<<<< HEAD
  CGRect ourBounds = [self bounds];
  CGFloat height = ourBounds.size.height;
  if (height != [self verifyHeight:height]) {
    [(TiViewProxy *)[self proxy] willChangeSize];
    return;
  }

  CGRect toolBounds;
  toolBounds.size = [[self toolBar] sizeThatFits:ourBounds.size];
  toolBounds.origin.x = 0.0;
  toolBounds.origin.y = hideTopBorder ? -1.0 : 0.0;
  [toolBar setFrame:toolBounds];
=======
    CGRect ourBounds = [self bounds];
    CGFloat height = ourBounds.size.height;
    if (height != [self verifyHeight:height]) {
        [(TiViewProxy *)[self proxy] willChangeSize];
        return;
    }

    CGRect toolBounds;
    toolBounds.size = [[self toolBar] sizeThatFits:ourBounds.size];
    toolBounds.origin.x = 0.0;
    toolBounds.origin.y = hideTopBorder ? -1.0 : 0.0;
    [toolBar setFrame:toolBounds];
>>>>>>> d66b03e449579adc243c52d3139083cf16a80604
}
#endif

- (void)setItems_:(id)value
{
<<<<<<< HEAD
  ENSURE_TYPE_OR_NIL(value, NSArray);
  if (value != nil) {
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:[value count]];
    Class proxyClass = [TiViewProxy class];
    for (TiViewProxy *thisProxy in value) {
      ENSURE_CLASS(thisProxy, proxyClass);
      if (![thisProxy supportsNavBarPositioning]) {
        //TODO: This is an exception that should have been raised long ago.
        DebugLog(@"[ERROR] %@ does not support being in a toolbar!", thisProxy);
        //continue;
      }
      if ([thisProxy conformsToProtocol:@protocol(TiToolbarButton)]) {
        [(id<TiToolbarButton>)thisProxy setToolbar:(id<TiToolbar>)self.proxy];
      }
      [thisProxy windowWillOpen];
      [result addObject:[thisProxy barButtonItem]];
      [thisProxy windowDidOpen];
    }
    [[self toolBar] setItems:result];
  } else {
    UIToolbar *toolbar = [self toolBar];
    if (toolbar != nil) {
      for (id thisProxy in [toolbar items]) {
        if ([thisProxy conformsToProtocol:@protocol(TiToolbarButton)]) {
          [(id<TiToolbarButton>)thisProxy setToolbar:nil];
        }
      }
    }
    [toolbar setItems:nil];
  }
=======
    ENSURE_TYPE_OR_NIL(value, NSArray);
    if (value != nil) {
        NSMutableArray *result = [NSMutableArray arrayWithCapacity:[value count]];
        Class proxyClass = [TiViewProxy class];
        for (TiViewProxy *thisProxy in value) {
            ENSURE_CLASS(thisProxy, proxyClass);
            if (![thisProxy supportsNavBarPositioning]) {
                //TODO: This is an exception that should have been raised long ago.
                DebugLog(@"[ERROR] %@ does not support being in a toolbar!", thisProxy);
                //continue;
            }
            if ([thisProxy conformsToProtocol:@protocol(TiToolbarButton)]) {
                [(id<TiToolbarButton>)thisProxy setToolbar:(id<TiToolbar>)self.proxy];
            }
            [thisProxy windowWillOpen];
            [result addObject:[thisProxy barButtonItem]];
            [thisProxy windowDidOpen];
        }
        [[self toolBar] setItems:result];
    } else {
        UIToolbar *toolbar = [self toolBar];
        if (toolbar != nil) {
            for (id thisProxy in [toolbar items]) {
                if ([thisProxy conformsToProtocol:@protocol(TiToolbarButton)]) {
                    [(id<TiToolbarButton>)thisProxy setToolbar:nil];
                }
            }
        }
        [toolbar setItems:nil];
    }
>>>>>>> d66b03e449579adc243c52d3139083cf16a80604
}

- (void)setBackgroundImage_:(id)arg
{
<<<<<<< HEAD
  UIImage *image = [self loadImage:arg];
  [[self toolBar] setBackgroundImage:image forToolbarPosition:(extendsBackground ? UIBarPositionTopAttached : UIBarPositionAny)barMetrics:UIBarMetricsDefault];
  self.backgroundImage = arg;
=======
    UIImage *image = [self loadImage:arg];
    [[self toolBar] setBackgroundImage:image forToolbarPosition:(extendsBackground ? UIBarPositionTopAttached : UIBarPositionAny)barMetrics:UIBarMetricsDefault];
    self.backgroundImage = arg;
>>>>>>> d66b03e449579adc243c52d3139083cf16a80604
}

- (void)setBarColor_:(id)value
{
<<<<<<< HEAD
  TiColor *newBarColor = [TiUtils colorValue:value];

  [[self toolBar] setBarStyle:[TiUtils barStyleForColor:newBarColor]];
  [toolBar setTranslucent:[TiUtils barTranslucencyForColor:newBarColor]];
  UIColor *barColor = [TiUtils barColorForColor:newBarColor];
  [toolBar setBarTintColor:barColor];
=======
    TiColor *newBarColor = [TiUtils colorValue:value];

    [[self toolBar] setBarStyle:[TiUtils barStyleForColor:newBarColor]];
    [toolBar setTranslucent:[TiUtils barTranslucencyForColor:newBarColor]];
    UIColor *barColor = [TiUtils barColorForColor:newBarColor];
    [toolBar setBarTintColor:barColor];
>>>>>>> d66b03e449579adc243c52d3139083cf16a80604
}

- (void)setTintColor_:(id)color
{
<<<<<<< HEAD
  TiColor *ticolor = [TiUtils colorValue:color];
  UIColor *theColor = [ticolor _color];
  [[self toolBar] setTintColor:theColor];
  [self setTintColor:theColor];
=======
    TiColor *ticolor = [TiUtils colorValue:color];
    UIColor *theColor = [ticolor _color];
    [[self toolBar] setTintColor:theColor];
    [self setTintColor:theColor];
>>>>>>> d66b03e449579adc243c52d3139083cf16a80604
}

- (void)setTranslucent_:(id)value
{
<<<<<<< HEAD
  [toolBar setTranslucent:[TiUtils boolValue:value]];
=======
    [toolBar setTranslucent:[TiUtils boolValue:value]];
>>>>>>> d66b03e449579adc243c52d3139083cf16a80604
}

#ifndef TI_USE_AUTOLAYOUT
- (void)frameSizeChanged:(CGRect)frame bounds:(CGRect)bounds
{
<<<<<<< HEAD
  [super frameSizeChanged:frame bounds:bounds];
  CGFloat height = bounds.size.height;

  if (height != [self verifyHeight:height]) {
    [(TiViewProxy *)[self proxy] willChangeSize];
  }
=======
    [super frameSizeChanged:frame bounds:bounds];
    CGFloat height = bounds.size.height;

    if (height != [self verifyHeight:height]) {
        [(TiViewProxy *)[self proxy] willChangeSize];
    }
>>>>>>> d66b03e449579adc243c52d3139083cf16a80604
}

#endif

- (CGFloat)verifyHeight:(CGFloat)suggestedHeight
{
<<<<<<< HEAD
  CGFloat result = [[self toolBar] sizeThatFits:CGSizeZero].height;
  if (hideTopBorder) {
    result -= 1.0;
  }
  if (showBottomBorder) {
    result += 1.0;
  }
  return result;
=======
    CGFloat result = [[self toolBar] sizeThatFits:CGSizeZero].height;
    if (hideTopBorder) {
        result -= 1.0;
    }
    if (showBottomBorder) {
        result += 1.0;
    }
    return result;
>>>>>>> d66b03e449579adc243c52d3139083cf16a80604
}

@end

#endif

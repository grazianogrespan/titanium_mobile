/**
 * Appcelerator Titanium Mobile
 * Copyright (c) 2009-2010 by Appcelerator, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */
#ifdef USE_TI_PLATFORM

#import "TiPlatformDisplayCaps.h"
#import "TiUtils.h"

@implementation TiPlatformDisplayCaps

// NOTE: device capabilities currently are hardcoded for iPad, while high/low
// display density is now detected for iPhone / iPod Touch under iOS 4.

- (id)density
{
  if ([TiUtils isRetinaHDDisplay]) {
    return @"xhigh";
  }
  if ([TiUtils isRetinaDisplay]) {
    return @"high";
  }
  return @"medium";
}

- (NSString *)apiName
{
  return @"Ti.Platform.DisplayCaps";
}

- (id)dpi
{
  return [NSNumber numberWithInt:[TiUtils dpi]];
}

- (BOOL)isDevicePortrait
{
  UIDeviceOrientation orientation = [UIDevice currentDevice].orientation;
  return (orientation == UIDeviceOrientationPortrait || orientation == UIDeviceOrientationPortraitUpsideDown || orientation == UIDeviceOrientationUnknown);
}

- (BOOL)isUIPortrait
{
  UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
  return UIInterfaceOrientationIsPortrait(orientation);
}

- (NSNumber *)platformWidth
{
<<<<<<< HEAD
  CGRect mainScreenBounds = [[UIScreen mainScreen] bounds];
  return [NSNumber numberWithFloat:mainScreenBounds.size.width];
=======
    CGRect mainScreenBounds = [[UIScreen mainScreen] bounds];
    return [NSNumber numberWithFloat:mainScreenBounds.size.width];
>>>>>>> d66b03e449579adc243c52d3139083cf16a80604
}

- (NSNumber *)platformHeight
{
<<<<<<< HEAD
  CGRect mainScreenBounds = [[UIScreen mainScreen] bounds];
  return [NSNumber numberWithFloat:mainScreenBounds.size.height];
=======
    CGRect mainScreenBounds = [[UIScreen mainScreen] bounds];
    return [NSNumber numberWithFloat:mainScreenBounds.size.height];
>>>>>>> d66b03e449579adc243c52d3139083cf16a80604
}

- (NSNumber *)logicalDensityFactor
{
  return [NSNumber numberWithFloat:[[UIScreen mainScreen] scale]];
}
@end

#endif

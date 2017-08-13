/**
 * titanium-arkit
 *
 * Created by Hans Knöchel
 * Copyright (c) 2017 Hans Knöchel. All rights reserved.
 */

@import ARKit;

#import "TiArkitModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"

@implementation TiArkitModule

#pragma mark Internal

- (NSString *)moduleGUID
{
  return @"8dffad53-18ac-4879-b215-df36d24b6ea0";
}

- (NSString *)moduleId
{
  return @"ti.arkit";
}

#pragma mark Lifecycle

- (void)startup
{
  [super startup];
  NSLog(@"[DEBUG] %@ loaded", self);
}

#pragma Public APIs

- (NSNumber *)isSupported:(id __unused)unused
{
#ifndef __IPHONE_11_0
  return NUMBOOL(NO);
#endif

  return NUMBOOL([TiUtils isIOSVersionOrGreater:@"11.0"] && [ARConfiguration isSupported]);
}

#pragma mark AR-Constants

MAKE_SYSTEM_PROP(PLANE_DETECTION_NONE, ARPlaneDetectionNone);
MAKE_SYSTEM_PROP(PLANE_DETECTION_HORIZONTAL, ARPlaneDetectionHorizontal);

@end

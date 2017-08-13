/**
 * Ti.ARKit
 *
 * Created by Hans Knöchel
 * Copyright (c) 2017 Hans Knöchel. All rights reserved.
 */

#import "TiModule.h"

@interface TiArkitModule : TiModule {
}

/**
 @abstract Determines whether this device supports ARKit.
 
 @param unused An unused proxy-parameter.
 @return Whether the device supports ARKit.
 @since 1.0.0
 */
- (NSNumber *)isSupported:(id __unused)unused;

@end

/**
 * Appcelerator Titanium Mobile
 * Copyright (c) 2009-2017 by Appcelerator, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */
#import "TiViewProxy.h"

@interface TiArkitSceneViewProxy : TiViewProxy {
}

/**
 @abstract Run an ARKit scene.
 
 @param unused The arguments passed to the run-configuration.
 @since 1.0.0
 */
- (void)run:(id)args;

/**
 @abstract Pause a running ARKit scene.
 
 @param unused An unused proxy-parameter.
 @since 1.0.0
 */
- (void)pause:(id __unused)unused;

/**
 @abstract Adds an anchor to the session.
 
 @param args The anchor to add.
 @since 1.0.0
 */
- (void)addAnchor:(id)args;

/**
 @abstract Removes an anchor from the session.
 
 @param args The anchor to remove.
 @since 1.0.0
 */
- (void)removeAnchor:(id)args;

@end

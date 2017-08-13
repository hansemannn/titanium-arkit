/**
 * Ti.ARKit
 *
 * Created by Hans Knöchel
 * Copyright (c) 2017 Hans Knöchel. All rights reserved.
 */

#import "TiViewProxy.h"

@interface TiArkitSceneViewProxy : TiViewProxy {
}

/**
 @abstract Runs the session with the provided configuration.
 
 @param args The arguments passed to the run-configuration.
 @since 1.0.0
 */
- (void)run:(id)args;

/**
 @abstract Pauses the session.
 
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

/**
 @abstract Determines whether the view will update the scene’s lighting.
 
 @param automaticallyUpdatesLighting Boolean indicating whether the view will update the scene’s lighting.
 @since 1.0.0
 */
- (void)setAutomaticallyUpdatesLighting:(NSNumber *)automaticallyUpdatesLighting;

/**
 @abstract Determines whether the receiver should display statistics info like FPS.
 
 @param showStatistics Boolean indicating whether statistics should be shown.
 @since 1.0.0
 */
- (void)setShowStatistics:(NSNumber *)showStatistics;

@end

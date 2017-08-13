/**
 * Ti.ARKit
 *
 * Created by Hans Knöchel
 * Copyright (c) 2017 Hans Knöchel. All rights reserved.
 */

#import "TiArkitSceneView.h"
#import "TiArkitSceneViewProxy.h"
#import "TiUtils.h"

#include "stdlib.h"

@implementation TiArkitSceneViewProxy

- (TiArkitSceneView *)sceneView
{
  return (TiArkitSceneView *)[self view];
}

#pragma mark Public API's

- (void)run:(id)args
{
  ENSURE_SINGLE_ARG_OR_NIL(args, NSDictionary);
  
  ARWorldTrackingConfiguration *config = [[ARWorldTrackingConfiguration alloc] init];
  NSNumber *planeDetection = [args objectForKey:@"planeDetection"];
  NSNumber *worldAlignment = [args objectForKey:@"worldAlignment"];
  NSNumber *lightEstimationEnabled = [args objectForKey:@"lightEstimationEnabled"];
  NSNumber *providesAudioData = [args objectForKey:@"providesAudioData"];
  
  if (planeDetection != nil) {
    [config setPlaneDetection:[TiUtils intValue:planeDetection def:ARPlaneDetectionNone]];
  }

  if (worldAlignment != nil) {
    [config setWorldAlignment:[TiUtils intValue:worldAlignment def:ARWorldAlignmentGravity]];
  }

  if (lightEstimationEnabled != nil) {
    [config setLightEstimationEnabled:[TiUtils boolValue:lightEstimationEnabled def:YES]];
  }

  if (providesAudioData != nil) {
    [config setProvidesAudioData:[TiUtils boolValue:providesAudioData def:YES]];
  }

  [[[[self sceneView] sceneView] session] runWithConfiguration:config];
}

- (void)pause:(id)unused
{
  [[[[self sceneView] sceneView] session] pause];
}

- (void)addAnchor:(id)args
{
  ENSURE_SINGLE_ARG(args, NSArray);
  [[[[self sceneView] sceneView] session] addAnchor:[[ARAnchor alloc] initWithTransform:[self matrixFromArray:args]]];
}

- (void)removeAnchor:(id)args
{
  ENSURE_SINGLE_ARG(args, NSArray);
  [[[[self sceneView] sceneView] session] removeAnchor:[[ARAnchor alloc] initWithTransform:[self matrixFromArray:args]]];
}

- (void)setAutomaticallyUpdatesLighting:(NSNumber *)automaticallyUpdatesLighting
{
  [[[self sceneView] sceneView] setAutomaticallyUpdatesLighting:[TiUtils boolValue:automaticallyUpdatesLighting]];
}

- (void)setShowStatistics:(NSNumber *)showStatistics
{
  [[[self sceneView] sceneView] setShowsStatistics:[TiUtils boolValue:showStatistics def:NO]];
}

#pragma mark Utilities

- (matrix_float4x4)matrixFromArray:(NSArray *)array
{
  NSArray *col0 = [array objectAtIndex:0];
  NSArray *col1 = [array objectAtIndex:1];
  NSArray *col2 = [array objectAtIndex:2];
  NSArray *col3 = [array objectAtIndex:3];
  
  matrix_float4x4 matrix = {
    .columns[0] = {
      [TiUtils floatValue:[col0 objectAtIndex:0]],
      [TiUtils floatValue:[col0 objectAtIndex:1]],
      [TiUtils floatValue:[col0 objectAtIndex:2]],
      [TiUtils floatValue:[col0 objectAtIndex:3]]
    },
    .columns[1] = {
      [TiUtils floatValue:[col1 objectAtIndex:0]],
      [TiUtils floatValue:[col1 objectAtIndex:1]],
      [TiUtils floatValue:[col1 objectAtIndex:2]],
      [TiUtils floatValue:[col1 objectAtIndex:3]]
    },
    .columns[2] = {
      [TiUtils floatValue:[col2 objectAtIndex:0]],
      [TiUtils floatValue:[col2 objectAtIndex:1]],
      [TiUtils floatValue:[col2 objectAtIndex:2]],
      [TiUtils floatValue:[col2 objectAtIndex:3]]
    },
    .columns[3] = {
      [TiUtils floatValue:[col3 objectAtIndex:0]],
      [TiUtils floatValue:[col3 objectAtIndex:1]],
      [TiUtils floatValue:[col3 objectAtIndex:2]],
      [TiUtils floatValue:[col3 objectAtIndex:3]]
    }
  };
  
  return matrix;
}

#pragma mark Layout Helper

USE_VIEW_FOR_CONTENT_WIDTH

USE_VIEW_FOR_CONTENT_HEIGHT

- (TiDimension)defaultAutoWidthBehavior:(id)unused
{
  return TiDimensionAutoFill;
}

- (TiDimension)defaultAutoHeightBehavior:(id)unused
{
  return TiDimensionAutoFill;
}

@end

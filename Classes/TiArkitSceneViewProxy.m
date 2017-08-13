/**
 * Appcelerator Titanium Mobile
 * Copyright (c) 2009-2017 by Appcelerator, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
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
  
  if (planeDetection != nil) {
    [config setPlaneDetection:[TiUtils intValue:planeDetection def:ARPlaneDetectionNone]];
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

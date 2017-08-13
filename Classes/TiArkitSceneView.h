/**
 * Appcelerator Titanium Mobile
 * Copyright (c) 2009-2017 by Appcelerator, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */
@import ARKit;
#import "TiUIView.h"

@interface TiArkitSceneView : TiUIView <ARSCNViewDelegate> {
  @private
  TiDimension width;
  TiDimension height;
  CGFloat autoHeight;
  CGFloat autoWidth;
}

@property (nonatomic, strong) ARSCNView *sceneView;

- (void)setShowStatistics_:(NSNumber *)showStatistics;

@end

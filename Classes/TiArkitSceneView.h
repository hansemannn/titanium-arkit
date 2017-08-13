/**
 * Ti.ARKit
 *
 * Created by Hans Knöchel
 * Copyright (c) 2017 Hans Knöchel. All rights reserved.
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

@end

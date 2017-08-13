/**
 * Ti.ARKit
 *
 * Created by Hans Knöchel
 * Copyright (c) 2017 Hans Knöchel. All rights reserved.
 */

#import "TiArkitSceneView.h"

@implementation TiArkitSceneView

- (ARSCNView *)sceneView
{
  if (_sceneView == nil) {
    // Create view
    _sceneView = [[ARSCNView alloc] init];
    [_sceneView setDelegate:self];
    [_sceneView setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
    
    // Add scene
    SCNScene *scene = [SCNScene sceneNamed:[[self proxy] valueForKey:@"scene"]];
    [_sceneView setScene:scene];
    
    // Add to super-view
    [self addSubview:_sceneView];
  }

  return _sceneView;
}

#pragma mark ARSCNViewDelegate

- (void)renderer:(id<SCNSceneRenderer>)renderer didAddNode:(SCNNode *)node forAnchor:(ARAnchor *)anchor
{
  if ([[self proxy] _hasListeners:@"didAddNode"]) {
    [[self proxy] fireEvent:@"didAddNode" withObject:@{@"node": node.name, @"anchor": anchor.identifier.UUIDString}];
  }
}

- (void)renderer:(id<SCNSceneRenderer>)renderer didUpdateNode:(SCNNode *)node forAnchor:(ARAnchor *)anchor
{
  if ([[self proxy] _hasListeners:@"didUpdateNode"]) {
    [[self proxy] fireEvent:@"didUpdateNode" withObject:@{@"node": node.name, @"anchor": anchor.identifier.UUIDString}];
  }
}

- (void)renderer:(id<SCNSceneRenderer>)renderer didRemoveNode:(SCNNode *)node forAnchor:(ARAnchor *)anchor
{
  if ([[self proxy] _hasListeners:@"didRemoveNode"]) {
    [[self proxy] fireEvent:@"didRemoveNode" withObject:@{@"node": node.name, @"anchor": anchor.identifier.UUIDString}];
  }
}

- (void)renderer:(id<SCNSceneRenderer>)renderer didRenderScene:(SCNScene *)scene atTime:(NSTimeInterval)time
{
  if ([[self proxy] _hasListeners:@"didRenderScene"]) {
    [[self proxy] fireEvent:@"didRenderScene" withObject:@{@"scene": @{}, @"timestamp": NUMDOUBLE(time)}]; // FIXME: Wrap SCNScene into Ti-object?
  }

}

#pragma mark Layout Helper

- (void)updateContentMode
{
  if (self != nil) {
    [self setContentMode:[self contentModeForSceneView]];
  }
}

- (UIViewContentMode)contentModeForSceneView
{
  if (TiDimensionIsAuto(width) || TiDimensionIsAutoSize(width) || TiDimensionIsUndefined(width) || TiDimensionIsAuto(height) || TiDimensionIsAutoSize(height) || TiDimensionIsUndefined(height)) {
    return UIViewContentModeScaleAspectFit;
  } else {
    return UIViewContentModeScaleToFill;
  }
}

- (void)frameSizeChanged:(CGRect)frame bounds:(CGRect)bounds
{
  for (UIView *child in [[self sceneView] subviews]) {
    [TiUtils setView:child positionRect:bounds];
  }

  [super frameSizeChanged:frame bounds:bounds];
}

- (CGFloat)contentWidthForWidth:(CGFloat)suggestedWidth
{
  if (autoWidth > 0) {
    //If height is DIP returned a scaled autowidth to maintain aspect ratio
    if (TiDimensionIsDip(height) && autoHeight > 0) {
      return roundf(autoWidth * height.value / autoHeight);
    }
    return autoWidth;
  }

  CGFloat calculatedWidth = TiDimensionCalculateValue(width, autoWidth);
  if (calculatedWidth > 0) {
    return calculatedWidth;
  }

  return 0;
}

- (CGFloat)contentHeightForWidth:(CGFloat)width_
{
  if (width_ != autoWidth && autoWidth > 0 && autoHeight > 0) {
    return (width_ * autoHeight / autoWidth);
  }

  if (autoHeight > 0) {
    return autoHeight;
  }

  CGFloat calculatedHeight = TiDimensionCalculateValue(height, autoHeight);
  if (calculatedHeight > 0) {
    return calculatedHeight;
  }

  return 0;
}

- (UIViewContentMode)contentMode
{
  if (TiDimensionIsAuto(width) || TiDimensionIsAutoSize(width) || TiDimensionIsUndefined(width) || TiDimensionIsAuto(height) || TiDimensionIsAutoSize(height) || TiDimensionIsUndefined(height)) {
    return UIViewContentModeScaleAspectFit;
  } else {
    return UIViewContentModeScaleToFill;
  }
}

@end

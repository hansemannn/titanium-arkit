# ARKit in Axway Titanium SDK

Use the iOS 11+ ARKit framework in the Axway Titanium SDK.

## Thoughts

Supporting ARKit does not simply mean to write some public methods that people can use to "support ARKit in their app".
It means to write API's for SceneKit, SpriteKit, ARKit and all bindings around those frameworks. The current implementation starts by creating
new scene-views where objects can be placed in.

That's why it is not clear, yet, what kind of API's should be supported and which one don't. I would recommend everyone to open a
new issue and leave his/her thoughts regarding their ARKit use-case with Titanium, so the explicit implementation can be scoped.

Until then, it does not make sense to port ARKit example to Titanium, since they will always be limited to the exact example-usage, without the
possibility of customizations.

## Documentation

### `isSupported()`
Whether the current device supports this `ARKit`.

### SceneView
A ARKit scene-view. Create with `createSceneView(args)`.

#### Methods

##### `run(args)`
Runs the session with the provided configuration. Optional parameters:
- `planeDetection` (Number): Type of planes to detect in the scene.
  - `PLANE_DETECTION_NONE`
  - `PLANE_DETECTION_HORIZONTAL`
- `worldAlignment` (Number): Determines how the coordinate system should be aligned with the world.
  - `WORLD_ALIGNMENT_CAMERA`
  - `WORLD_ALIGNMENT_GRAVITY`
  - `WORLD_ALIGNMENT_GRAVITY_AND_HEADING`
- `lightEstimationEnabled` (Boolean): Enable or disable light estimation.
- `providesAudioData` (Boolean): Determines whether to capture and provide audio data.

##### `pause()`
Pauses the session.

##### `addAnchor()`
Adds an anchor to the session.

##### `removeAnchor`
Removes an anchor from the session.

#### Properties

##### `automaticallyUpdatesLightning`
Determines whether the view will update the scene’s lighting.

##### `showStatistics`
Determines whether the receiver should display statistics info like FPS.

## Roadmap
- [x] Q3/2017: Basic ARKit support (load 2D/3D models, display them in the camera)
- [ ] Q4/2017: More advanced API's based on the developers response

## Author
Hans Knöchel ([@hansemannnn](https://twitter.com/hansemannnn) / [Web](http://hans-knoechel.de))

## License
MIT

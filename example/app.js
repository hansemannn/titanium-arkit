var ARKit = require('ti.arkit');

var sceneView = ARKit.createSceneView({
	scene: 'Titanium.scnassets/ti-logo.scn' // Create your Scene Assets in Xcode and place them in <project-dir>/app/assets/iphone/ (Alloy) or <project-dir>/Resources/ (Classic)
});

win.addEventListener('open', function() {
	sceneView.run();
});

win.add(sceneView);
win.open();

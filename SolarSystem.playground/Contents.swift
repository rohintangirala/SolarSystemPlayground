//: A SpriteKit based Playground

import PlaygroundSupport
import SpriteKit

// Load the SKScene from 'GameScene.sks'
let sceneView = SKView(frame: CGRect(x:0 , y:0, width: 600, height: 500))

if let scene = SolarSystemScene(fileNamed: "SolarSystemScene") {
    // Set the scale mode to scale to fit the window
    scene.scaleMode = .aspectFill

    // Present the scene
    sceneView.presentScene(scene)
}

PlaygroundSupport.PlaygroundPage.current.liveView = sceneView

//
//  GameScene.swift
//  mc1_scene3
//
//  Created by sei on 2023/03/29.
//

import Foundation
import SpriteKit

// A simple game scene with falling boxes
class GameScene: SKScene {
    override func didMove(to view: SKView) {
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let radSize = CGFloat(30)
        
        // Load the image from your assets folder
        let cloudImage = UIImage(named: "cookie_1")
        // Create a texture from the image
        let cloudTexture = SKTexture(image: cloudImage!)
        // Create a shape node with a rectangular path that matches the size of the image
        let cloudShape = SKSpriteNode(texture: cloudTexture, size: cloudTexture.size())
        // Set the fill texture of the shape node to the dragon texture
//        cloudShape.fillTexture = cloudTexture
        // Set the position of the shape node to where you want it on the screen
        cloudShape.position = location
        // Cloud Size
        cloudShape.setScale(0.1)
        // Adjust Opacity
        cloudShape.alpha = 0.5

        cloudShape.physicsBody = SKPhysicsBody(circleOfRadius: radSize * 0.4)
        addChild(cloudShape)
        
        
        //        let location = CGPoint(x: Double(Int.random(in: 10...300)), y: 15)
        //        let box = SKShapeNode(circleOfRadius: radSize)
        //        box.alpha = 0.5
        //        box.position = location
        //        box.physicsBody = SKPhysicsBody(circleOfRadius: radSize * 0.7)
        //        box.touchesEnded(touches, with: event)
        //        addChild(box)
        
        
    }
}

//
//  GameScene.swift
//  Scrumdinger
//
//  Created by JaeUngJang on 2023/03/27.
//

import Foundation
import SpriteKit

// A simple game scene with floating clouds
class CloudFloatingScene: SKScene {
    
    override func didMove(to view: SKView) {
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        var isRemoved:Bool = false
        
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let radSize = CGFloat(30)
        
        let touchedNode = self.nodes(at: location).first
        if let nodeToRemove = touchedNode{
            if location.y > 130 {
                // 서서히 사라지게 ing...
                let fadeOutAction = SKAction.fadeOut(withDuration: 0.5)
                let removeAction = SKAction.removeFromParent()
                let sequence = SKAction.sequence([fadeOutAction, removeAction])
                nodeToRemove.run(sequence)

                nodeToRemove.removeFromParent()
                isRemoved.toggle()
            }
        }
        
        if isRemoved == false
        {
            let cloudText = ["성장", "성장지표", "피드백", "대화", "회고", "네트워크","성장환경", "함께", "동기부여", "성장 도움"]
            let cloudImageNames: [String] = ["1_cloud_1", "1_cloud_2", "1_cloud_3"]
            let cloudLable = SKLabelNode(text: cloudText.randomElement())
            
            // Load the image from your assets folder
            let cloudImage = UIImage(named: cloudImageNames.randomElement() ?? "1_cloud_1")

            // Create a texture from the image
            let cloudTexture = SKTexture(image: cloudImage!)
            // Create a sprite node that matches the size of the image
            let cloudShape = SKSpriteNode(texture: cloudTexture, size:cloudTexture.size())
            
            // Set the position of the shape node
            cloudShape.position = location
            // Cloud Size
            cloudShape.setScale(0.17)
            // Adjust Opacity
            cloudShape.alpha = 0.6
            
            
            cloudLable.position = CGPoint(x: 10 , y: -50)
            cloudLable.fontSize = 150
            cloudLable.fontColor = .black
            cloudLable.fontName = "AvenirNext-Bold"
            cloudLable.alpha = 0.8
            
            cloudShape.addChild(cloudLable)
            
            cloudShape.physicsBody = SKPhysicsBody(circleOfRadius: radSize)

            addChild(cloudShape)
        }
    }
}


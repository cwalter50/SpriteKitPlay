//
//  GameScene.swift
//  SpriteKitPlay
//
//  Created by Christopher Walter on 1/23/21.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {

    var background = SKSpriteNode(imageNamed: "Background")
    
    override func didMove(to view: SKView)
    {
        background.position = CGPoint(x: frame.size.width/2, y: frame.size.height/2)
        background.size = CGSize(width: frame.size.width, height: frame.size.width)
        addChild(background)
        
        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        
        self.physicsBody = border
        
        physicsWorld.gravity = CGVector(dx: 0, dy: -9.8)
        
    }
}

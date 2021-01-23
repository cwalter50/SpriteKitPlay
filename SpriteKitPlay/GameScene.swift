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
    
    var thorsHammer = SKSpriteNode()
    
    override func didMove(to view: SKView)
    {
        background.position = CGPoint(x: frame.size.width/2, y: frame.size.height/2)
        background.size = CGSize(width: frame.size.width, height: frame.size.width)
        addChild(background)
        
        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        
        self.physicsBody = border
        
        physicsWorld.gravity = CGVector(dx: 0, dy: -9.8)
        
        thorsHammer = childNode(withName: "Hammer") as! SKSpriteNode
        thorsHammer.position = CGPoint(x: 200, y: 200)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
  
        let touch = touches.first!
        let location = touch.location(in: self)
        print(location)
        let move = SKAction.moveTo(x: location.x, duration: 0.2)
        let movey = SKAction.moveTo(y: location.y, duration: 0)
        

        thorsHammer.run(move)
        thorsHammer.run(movey)
//        thorsHammer.position = location
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
   
        let touch = touches.first!
        let location = touch.location(in: self)
        print(location)
        let move = SKAction.moveTo(x: location.x, duration: 0.2)
        let movey = SKAction.moveTo(y: location.y, duration: 0)
        

        thorsHammer.run(move)
        thorsHammer.run(movey)
    }
    
    
}

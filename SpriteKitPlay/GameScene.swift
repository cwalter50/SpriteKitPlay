//
//  GameScene.swift
//  SpriteKitPlay
//
//  Created by Christopher Walter on 1/23/21.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {

    var background = SKSpriteNode(imageNamed: "Background")
    
    var thorsHammer = SKSpriteNode()
    var stacy = SKSpriteNode()
    
    override func didMove(to view: SKView)
    {
        background.position = CGPoint(x: frame.size.width/2, y: frame.size.height/2)
        background.size = CGSize(width: frame.size.width, height: frame.size.width)
        addChild(background)
        
        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        
        self.physicsBody = border
        
        
        physicsWorld.gravity = CGVector(dx: 0, dy: -9.8)
        physicsWorld.contactDelegate = self
        
        thorsHammer = childNode(withName: "Hammer") as! SKSpriteNode
        stacy = childNode(withName: "stacy") as! SKSpriteNode
        
        thorsHammer.physicsBody?.contactTestBitMask = 1 | 2
        stacy.physicsBody?.contactTestBitMask = 3
      
        
    }
    
    func didBegin(_ contact: SKPhysicsContact)
    {
        if (contact.bodyA.categoryBitMask == 1 || contact.bodyB.categoryBitMask == 1) && (contact.bodyA.categoryBitMask == 3 || contact.bodyB.categoryBitMask == 3)
        {
            // bob hit the hammer
            if contact.bodyA.categoryBitMask == 1
            {
                contact.bodyA.node?.removeFromParent()
            }
            else
            {
                contact.bodyB.node?.removeFromParent()
            }
            
        }
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

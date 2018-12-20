//
//  GameScene.swift
//  Pong For Watch Extension
//
//  Created by Phani Srikar on 20/12/18.
//  Copyright © 2018 Phani Srikar. All rights reserved.
//

import SpriteKit
import WatchKit
class GameScene: SKScene ,WKCrownDelegate{
    
  
    
    var player = SKSpriteNode()
    var ball = SKSpriteNode()
    var enemy = SKSpriteNode()

    
    
    override func sceneDidLoad() {
        ball.position.x = 0
        ball.position.y = 0
        
        player = (self.childNode(withName: "Player") as? SKSpriteNode)!
        ball = (self.childNode(withName: "Ball") as? SKSpriteNode)!
        enemy = (self.childNode(withName: "Enemy") as? SKSpriteNode)!
        
        
        
        ball.physicsBody?.applyImpulse(CGVector(dx: 5, dy: 5))
        
        let border = SKPhysicsBody(edgeLoopFrom: scene!.frame)
        border.friction = 0
        border.restitution = 1
        self.physicsBody = border
        
        

    }
    
    
    
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        enemy.run(SKAction.moveTo(x: ball.position.x, duration: 0.6))
        
        
        
        
    }
}

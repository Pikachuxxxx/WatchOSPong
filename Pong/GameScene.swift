//
//  GameScene.swift
//  Pong
//
//  Created by Phani Srikar on 20/12/18.
//  Copyright © 2018 Phani Srikar. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var player = SKSpriteNode()
    var ball = SKSpriteNode()
    var enemy = SKSpriteNode()
    let DX = 160
   
    override func didMove(to view: SKView) {
        
      
        player = (self.childNode(withName: "Player") as? SKSpriteNode)!
        ball = (self.childNode(withName: "Ball") as? SKSpriteNode)!
        enemy = (self.childNode(withName: "Enemy") as? SKSpriteNode)!
        
        
        
        ball.physicsBody?.applyImpulse(CGVector(dx: DX, dy: 160))
        
        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        border.friction = 0
        border.restitution = 1
        self.physicsBody = border
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches
        {
            let location = touch.location(in: self)
            
            player.run(SKAction.moveTo(x: location.x, duration: 0.2))
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches
        {
            let location = touch.location(in: self)
            
            player.run(SKAction.moveTo(x: location.x, duration: 0.2))
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        enemy.run(SKAction.moveTo(x: ball.position.x, duration: 0.6))
        
        
    }
}

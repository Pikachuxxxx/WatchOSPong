//
//  GameScene.swift
//  Pong For Watch Extension
//
//  Created by Phani Srikar on 20/12/18.
//  Copyright © 2018 Phani Srikar. All rights reserved.
//

import SpriteKit
import WatchKit
var MVDR = "STOP"
class GameScene: SKScene ,WKCrownDelegate{
    
    let tap =  WKTapGestureRecognizer()
    
    
    var user = SKSpriteNode()
    var ball = SKSpriteNode()
    var enemy = SKSpriteNode()
    var PlayerScore = SKLabelNode()
    var EnemyScore = SKLabelNode()

    let ges = WKSwipeGestureRecognizer()
    
    
   
    override func sceneDidLoad() {
        ball.position.x = 0
        ball.position.y = 0
        

        ball = (self.childNode(withName: "Ball") as! SKSpriteNode)
        enemy = (self.childNode(withName: "Enemy") as! SKSpriteNode)
        user = (self.childNode(withName: "Player") as! SKSpriteNode)
        
        PlayerScore = self.childNode(withName: "PlayerScore") as! SKLabelNode
        EnemyScore = self.childNode(withName: "EnemyScore") as! SKLabelNode
        
        
        
        ball.physicsBody?.applyImpulse(CGVector(dx: -3, dy: 3))
        
        let border = SKPhysicsBody(edgeLoopFrom: scene!.frame)
        border.friction = 0
        border.restitution = 1
        self.physicsBody = border
        
    PlayerScore.text = "HEL"
      

    }
    
    
    
    func moveSprite(moveDirection: String){
        
        
        
        
        
        
        switch moveDirection {
        case "UP":
           
           
                user.run(SKAction.moveTo(y: user.position.y + 60, duration: 0.2))
            print("here :\(user.position.x)")
            if user.position.y >= 170
            {
                MVDR = "STOP"
                user.run(SKAction.moveTo(y: user.position.y, duration: 0.2))
            
            }
        case "DOWN":
        
        
            user.run(SKAction.moveTo(y: user.position.y - 60, duration: 0.2))
                print("here :\(user.position.x)")
            if user.position.y <= -170
            {
                MVDR = "STOP"
                user.run(SKAction.moveTo(y: user.position.y, duration: 0.2))
               
            }
        case "STOP":
          
            user.run(SKAction.moveTo(y: user.position.y, duration: 0.2))

        default:
            break
        }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
       
        enemy.run(SKAction.moveTo(y: ball.position.y + 5, duration: 0.2))
   
       moveSprite(moveDirection: MVDR)
        
        if ball.position.x <= enemy.position.x + 25
        {
            ball.position.x = 0
            ball.position.y = 0
            
        }
        
        
        
        
        
        """
        if ball.position.x > enemy.position.x + 5
        {
            ball.position.x = 0//self.ball.position.x + 10
        }
        
        else ball.position.x < enemy.position.x + 5
        {
            ball.position.x = 0
        }
        
        if (ball.physicsBody?.velocity.dx)! <= CGFloat(integerLiteral: 1)
        {
            ball.physicsBody?.velocity.dx = 4
            ball.physicsBody?.velocity.dy = 4
            
        }
"""
        
}
}

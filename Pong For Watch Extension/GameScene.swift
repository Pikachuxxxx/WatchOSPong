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
        

        self.ball = (self.childNode(withName: "Ball") as! SKSpriteNode)
        self.enemy = (self.childNode(withName: "Enemy") as! SKSpriteNode)
        self.user = (self.childNode(withName: "Player") as! SKSpriteNode)
        
        self.PlayerScore = self.childNode(withName: "PlayerScore") as! SKLabelNode
        self.EnemyScore = self.childNode(withName: "EnemyScore") as! SKLabelNode
        
        
        
        ball.physicsBody?.applyImpulse(CGVector(dx: -3, dy: 3))
        
        let border = SKPhysicsBody(edgeLoopFrom: scene!.frame)
        border.friction = 0
        border.restitution = 1
        self.physicsBody = border
        
        PlayerScore.text = "0"
        EnemyScore.text = "0"
        
        
        
      
        
        let winner = SKLabelNode(fontNamed: "Chalkduster")
        winner.text = "You Win!"
        winner.fontSize = 10
        winner.fontColor = SKColor.green
        winner.position = CGPoint(x: frame.midX, y: frame.midY)
        
        self.addChild(winner)

    }
    
    
    
    func moveSprite(moveDirection: String){
        
        
        
        
        
        
        switch moveDirection {
        case "UP":
           
           
                user.run(SKAction.moveTo(y: user.position.y + 60, duration: 0.2))
            if user.position.y >= 170
            {
                MVDR = "STOP"
                user.run(SKAction.moveTo(y: user.position.y, duration: 0.2))
            
            }
        case "DOWN":
        
        
            user.run(SKAction.moveTo(y: user.position.y - 60, duration: 0.2))
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
            
            PlayerScore.text = "0"
            EnemyScore.text = "0"
            
            
        }
        else if ball.position.x >= enemy.position.x - 25
        {
            ball.position.x = 0
            ball.position.y = 0
        }
    
        
}
}

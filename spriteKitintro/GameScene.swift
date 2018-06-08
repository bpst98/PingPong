//
//  GameScene.swift
//  spriteKitintro
//
//  Created by Bhanu Pratap Singh Thapliyal on 07/04/18.
//  Copyright © 2018 Bhanu Pratap Singh Thapliyal. All rights reserved.
//

import SpriteKit

import GameplayKit

class GameScene: SKScene {
    
    var ball = SKSpriteNode()
    var enemy = SKSpriteNode()
    var main = SKSpriteNode()
    var score : [Int] = []
    
    
    
        override func didMove(to view: SKView)
        {
            
        startGame()
        
        ball = self.childNode(withName: "ball") as!SKSpriteNode
        
        enemy = self.childNode(withName: "enemy") as!SKSpriteNode
        
        main = self.childNode(withName: "main") as!SKSpriteNode
        
        ball.physicsBody?.applyImpulse(CGVector(dx: 20, dy: 20))
        
        let border = SKPhysicsBody (edgeLoopFrom: self.frame)
        
        border.friction = 0
        border.restitution = 1
        
        self.physicsBody = border
            
        }
    
    
    
    
    
    /* score calculation    */

    func startGame()
    {
        score = [0,0]
        
        
    }
    func addScore(win :SKSpriteNode)  {
        
        ball.position = CGPoint(x : 0,y :0)
        ball.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
        
        if win == main
        {
            score[0] += 1
            ball.physicsBody?.applyImpulse(CGVector(dx: 30, dy: 30))

            
        }
        else if win == enemy {
            score[1] += 1
            ball.physicsBody?.applyImpulse(CGVector(dx: -20, dy: -30))

        }
     
        print(score)
    }
    
    
    
    
    // makes the main player move
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for touch in touches
        {
            let location = touch.location(in: self)
            
            main.run(SKAction.moveTo(x: location.x, duration: 0.1))
        }
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches
        {
            let location = touch.location(in: self)
            
            main.run(SKAction.moveTo(x: location.x, duration: 0.1))
        }
    }
    
    
    
    //UPDATE  MAKES the enemy move
    
    override func update(_ currentTime: TimeInterval) {
        
        enemy.run(SKAction.moveTo(x: ball.position.x, duration: 0.7))
        
        if (ball.position.y <=  main.position.y - 60)
        {
            addScore(win: enemy)
        }
        else if (ball.position.y >= enemy.position.y + 60 )
        {
            addScore(win: main)
        }
        
        print(score)
        
    }
}

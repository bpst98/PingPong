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
    
    
    
    
    override func didMove(to view: SKView) {
        
        ball = self.childNode(withName: "ball") as!SKSpriteNode
        
        enemy = self.childNode(withName: "enemy") as!SKSpriteNode
        
        main = self.childNode(withName: "main") as!SKSpriteNode
        
        ball.physicsBody?.applyImpulse(CGVector(dx: 20, dy: 20))
        
        let border = SKPhysicsBody (edgeLoopFrom: self.frame)
        
        border.friction = 0
        border.restitution = 1
        
        self.physicsBody = border
        
       
        
       
    }
    
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
    
    override func update(_ currentTime: TimeInterval) {
        
         enemy.run(SKAction.moveTo(x: ball.position.x, duration: 1.0))
        
    }
}

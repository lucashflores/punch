//
//  GameScene.swift
//  FlappyBirdExample
//
//  Created by Luiz Veloso on 19/03/24.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    private var hitSack: SKNode!
    private var hitsLabel: SKLabelNode!
    private var progressBarParent: SKNode!
    private var progressBar: SKNode!
    private var strengthLabel: SKLabelNode!
    private var hits = 0
    private var strength = 1
    
    override func didMove(to view: SKView) {
        hitSack = self.childNode(withName: "hitsack")
        hitsLabel = self.childNode(withName: "hits_label") as? SKLabelNode
        hitsLabel.fontName = "AvenirNext-Bold"
        strengthLabel = self.childNode(withName: "strength_label") as? SKLabelNode
        strengthLabel.fontName = "AvenirNext-Bold"
        progressBarParent = self.childNode(withName: "progress_bar")
        progressBar = self.progressBarParent.childNode(withName: "progress")
    }
    
    
    func incrementProgressBar(amount: CGFloat) {
        if (progressBar.xScale >= 0.99) {
            progressBar.xScale = 0
            strength += 1
            strengthLabel.text = "STR \(strength)"
        }
        else if (progressBar.xScale + amount > 0.99) {
            progressBar.xScale = 0.99
            progressBar.position.x = progressBar.xScale * 50 + 0.5
        }
        else {
            progressBar.xScale += amount
            progressBar.position.x = progressBar.xScale * 50 + 0.5
        }
        
    }
    
    func touchDown(atPoint pos : CGPoint) {
        if hitSack.contains(pos) {
            hits += 1
            hitsLabel.text = "\(hits) hits!"
            incrementProgressBar(amount: 0.04)
        }
    }
    
    func touchMoved(toPoint pos : CGPoint) {
    }
    
    func touchUp(atPoint pos : CGPoint) {
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}

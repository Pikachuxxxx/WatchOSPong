//
//  InterfaceController.swift
//  Pong For Watch Extension
//
//  Created by Phani Srikar on 20/12/18.
//  Copyright © 2018 Phani Srikar. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController,WKCrownDelegate {
    
    @IBOutlet var skInterface: WKInterfaceSKScene!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        
        // Load the SKScene from 'GameScene.sks'
        if let scene = GameScene(fileNamed: "GameScene") {
            
            // Set the scale mode to scale to fit the window
            scene.scaleMode = .fill
            
            // Present the scene
            self.skInterface.presentScene(scene)
            crownSequencer.delegate = self
            crownSequencer.focus()
            
            // Use a value that will maintain a consistent frame rate
            self.skInterface.preferredFramesPerSecond = 30
            scene.backgroundColor = #colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 1)
        
        }
        
    
    }
    
    

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
}

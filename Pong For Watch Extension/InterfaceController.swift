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
    
    @IBAction func LEFT(_ sender: Any) {
        MVDR = "DOWN"
        print("DWN")
    }
    
    
    @IBAction func RIGHT(_ sender: Any) {
        MVDR = "UP"
        print("U")
    }
    
    
    @IBOutlet var skInterface: WKInterfaceSKScene!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        
        // Load the SKScene from 'GameScene.sks'

        if let scene = GameScene(fileNamed: "GameScene") {
            
            print("Hello World")
            
            // Set the scale mode to scale to fit the window
            scene.scaleMode = .fill
            
            // Present the scene
            self.skInterface.presentScene(scene)
            crownSequencer.delegate = self
            crownSequencer.focus()
            
            // Use a value that will maintain a consistent frame rate
            self.skInterface.preferredFramesPerSecond = 30
                        
            
        
        }
   
        crownSequencer.delegate = self
        
        
        
    
    }
   
    
    func crownDidRotate(_ crownSequencer: WKCrownSequencer?, rotationalDelta: Double) {

        if rotationalDelta > 0
        {
            MVDR = "UP"
        }
        else if rotationalDelta < 0
        {
            MVDR = "DOWN"
        }
    }
    func crownDidBecomeIdle(_ crownSequencer: WKCrownSequencer?) {
        MVDR = "STOP"
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        crownSequencer.focus()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
}

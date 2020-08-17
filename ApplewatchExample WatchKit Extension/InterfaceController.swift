//
//  InterfaceController.swift
//  ApplewatchExample WatchKit Extension
//
//  Created by Sidharth Nayyar on 8/17/20.
//  Copyright © 2020 Sidharth Nayyar. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

class InterfaceController:
WKInterfaceController,WCSessionDelegate {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        if WCSession.isSupported() {
                  let session = WCSession.default
                  session.delegate = self
                  session.activate()
              }
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    var labelSaysHelloo:Bool = true
    
    @IBOutlet weak var labelsaysHello: WKInterfaceLabel!
    @IBAction func buttonPressed() {
        print("button Pressed")
        
            if (labelSaysHelloo == true) {
                labelsaysHello.setText("GOODBYE")
                self.labelSaysHelloo = false
            }
            else {
                labelsaysHello.setText("HELLO")
                self.labelSaysHelloo = true
            }
        }
    

    // WKSession function used by our app
        func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
            // Play a "click" sound when you get the message
            WKInterfaceDevice().play(.click)
            
            // output a debug message to the terminal
            print("WATCH: Got a message!")
            
            // update the message with a label
            labelsaysHello.setText("\(message)")
        }

    }


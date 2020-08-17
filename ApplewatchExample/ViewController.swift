//
//  ViewController.swift
//  ApplewatchExample
//
//  Created by Sidharth Nayyar on 8/17/20.
//  Copyright © 2020 Sidharth Nayyar. All rights reserved.
//

import UIKit
import WatchConnectivity
class ViewController: UIViewController,WCSessionDelegate {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    print("checking to see if wc session is supported")
        // Check if your IOS version can talk to the phone
             // Does your iPhone support "talking to a watch"?
            // If yes, then create the session
            // If no, then output error message
            if (WCSession.isSupported()) {
                print("PHONE: Phone supports WatchConnectivity!")
                let session = WCSession.default
                session.delegate = self
                session.activate()
            }
            else {
                print("PHONE: Phone does not support WatchConnectivity")
            }

    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
    

    @IBAction func buttonPressed(_ sender: UIButton) {
        
        if (WCSession.default.isReachable) {
         // construct the message you want to send
         // the message is in dictionary
         let message = ["Message": "Hello"]
        // send the message to the watch
         WCSession.default.sendMessage(message, replyHandler: nil)

    }
    
    }
}

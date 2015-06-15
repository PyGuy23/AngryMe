//
//  InterfaceController.swift
//  AngryMe WatchKit Extension
//
//  Created by newuser on 6/14/15.
//  Copyright (c) 2015 Power Streamer LLC. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    @IBOutlet weak var coolOff: WKInterfaceTimer!
    @IBOutlet weak var cooledOff: WKInterfaceLabel!
    @IBOutlet weak var cooledDown: WKInterfaceButton!
    @IBOutlet weak var mySwitch: WKInterfaceSwitch!
    
    
    
    
    var iscoolingOff = false
    var  isWalking = true

    @IBAction func coolOff1(value: Bool){
        
        
        iscoolingOff = !iscoolingOff
        
        if iscoolingOff{
            
            cooledOff.setText("Cool off")
            cooledDown.setTitle("Cool Down")
            
            
        }
        else{
           cooledOff.setText("Cool Down")
            cooledDown.setTitle("Cool Off")
        }
        
        
       
        isWalking = value
        if value{
            
            cooledOff.setText(icon())
            mySwitch.setTitle("")
            
            
            
        }
        else{
            cooledOff.setText(icon())
            mySwitch.setTitle("")
            
        }
        
        if isWalking{
            timerReset()
        }
        
        
    }
    func icon() -> String{
        if iscoolingOff {
            return coolingOffIcon
        }
        else{
            return cooledMeOffIcon
        }
    }
    
    func timerReset(){
        let interval: NSTimeInterval = 60.0
        coolOff.stop()
        
        
        let time = NSDate(timeIntervalSinceNow:interval)
        coolOff.setDate(time)
        coolOff.start()
        
    }
    
    let coolingOffIcon = " 😗"
    let cooledMeOffIcon = "😚"


    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        cooledOff.setText(coolingOffIcon)
        cooledOff.setText(icon())
        
        
        // Configure interface objects here.
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

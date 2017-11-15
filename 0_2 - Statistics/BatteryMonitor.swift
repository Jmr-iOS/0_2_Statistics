//
//  BatteryMon.swift
//  0_2 - Statistics
//
//  @ref    https://stackoverflow.com/questions/27475506/check-battery-level-ios-swift
//
//  Created by Justin Reina on 11/9/17.
//  Copyright © 2017 Jaostech. All rights reserved.
//
import UIKit


public class BatteryMonitor : NSObject {
    
    override init() {
        super.init();

        //Enable Battery Monitoring
        UIDevice.current.isBatteryMonitoringEnabled = true;
        print("Current Battery Level - \(UIDevice.current.batteryLevel*100)%");
        
        return;
    }
    
    class func getBatteryLevel() -> Float {

        //Enable Battery Monitoring
        UIDevice.current.isBatteryMonitoringEnabled = true;
        
        let battLvl : Float = UIDevice.current.batteryLevel;
        
        if(battLvl == -1) {
            return nan("unknown value");
        } else {
            return battLvl*100;
        }
    }
}


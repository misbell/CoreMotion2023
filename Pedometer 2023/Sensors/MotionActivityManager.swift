//
//  MotionActivityManager.swift
//  Pedometer 2023
//
//  Created by michael isbell on 10/13/23.
//

import Foundation
import CoreMotion



final class MotionActivityManager:  ObservableObject {
    
  //  var deviceMotion: CMDeviceMotion
 
    var activityManager: CMMotionActivityManager?
    /// Provides to create an instance of the CMPedometer.
   // var pedometer: CMPedometer?
    
    init() {
        activityManager = CMMotionActivityManager()
    }
    
    func checkIfMotionServicesAvailableOnThisDevice() {
        if CMMotionActivityManager.isActivityAvailable()  {
            activityManager = CMMotionActivityManager()
            startUpdates()
        }
        else {
            print("Motion Activity Unavailable on This Device")
            return
        }
       
    }
    
    func startUpdates() {
        
        
        guard let activityManager = self.activityManager else { return
        }
        
        activityManager.startActivityUpdates(to: OperationQueue.main) { (activity: CMMotionActivity?) in
            guard let activity = activity else { return }
            DispatchQueue.main.async {
                if activity.stationary {
                    print("Stationary")
                } else if activity.walking {
                    print("Walking")
                } else if activity.running {
                    print("Running")
                } else if activity.automotive {
                    print("Automotive")
                }
            }
        }
        
//        if CMPedometer.isStepCountingAvailable() {
//            pedometer.startUpdates(from: Date()) { pedometerData, error in
//                guard let pedometerData = pedometerData, error == nil else { return }
//                
//                DispatchQueue.main.async {
//                    print(pedometerData.numberOfSteps.intValue)
//                }
//            }
//        }
        
    }
    
    
}
    
 

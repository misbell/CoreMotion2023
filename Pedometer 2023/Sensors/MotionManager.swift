//
//  MotionManager.swift
//  Pedometer 2023
//
//  Created by michael isbell on 10/13/23.
//

import Foundation
import CoreMotion

class MotionManager: ObservableObject {
    @Published var motion: CMDeviceMotion?
    @Published var gravity: CMAcceleration?
    private var motionManager = CMMotionManager()
    
    init() {
        startUpdates()
    }
    
    func startUpdates() {
        if motionManager.isDeviceMotionAvailable {
            motionManager.startDeviceMotionUpdates(using: .xArbitraryCorrectedZVertical, to: .main) { (motion, error) in
                if let motion = motion {
                    self.motion = motion
                    self.gravity = self.motion?.gravity
                }
            }
        }
    }
}

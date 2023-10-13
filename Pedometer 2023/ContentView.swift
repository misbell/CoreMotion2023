//
//  ContentView.swift
//  Pedometer 2023
//
//  Created by Michael Prenez-Isbell on 10/12/23.
//

import SwiftUI
import CoreMotion



struct ContentView: View {
    
    // That’s because @ObservedObject is used to keep track of an object that has already been created, probably using @StateObject.
    
    @StateObject  var viewModel = MotionActivityManager()
    @StateObject var motionManager = MotionManager()
    
  
    
    var body: some View {
        VStack {
            Text("Device Attitude: pitch \(motionManager.motion?.attitude.pitch ?? .zero ) roll \(motionManager.motion?.attitude.roll ?? .zero) yaw \(motionManager.motion?.attitude.yaw ?? .zero) ")
            Text("Device Gravity: x \(motionManager.motion?.gravity.x ?? .zero) y \(motionManager.motion?.gravity.y ?? .zero) z \(motionManager.motion?.gravity.z ?? .zero) ")
            Text("Device Rotation: x \(motionManager.motion?.rotationRate.x ?? .zero) y \(motionManager.motion?.rotationRate.y ?? .zero) z \(motionManager.motion?.rotationRate.z ?? .zero) ")
            Text("User Acceleration: x \(motionManager.motion?.userAcceleration.x ?? .zero)  y \(motionManager.motion?.userAcceleration.y ?? .zero) z \(motionManager.motion?.userAcceleration.z ?? .zero) ")
            Text("Heading: \(motionManager.motion?.heading ?? .zero) ")
            Text("Magenetic Field: accuracy \(motionManager.motion?.magneticField.accuracy.rawValue ?? .zero ) field x \(motionManager.motion?.magneticField.field.x ?? .zero)  y \(motionManager.motion?.magneticField.field.y ?? .zero) z \(motionManager.motion?.magneticField.field.z ?? .zero) ")
            Text("Sensor Location: \(motionManager.motion?.sensorLocation.rawValue ?? .zero) ")
          
          }
        .padding()
        .onAppear() {
            viewModel.checkIfMotionServicesAvailableOnThisDevice()
           
        }
    }
}

#Preview {
    ContentView()
}



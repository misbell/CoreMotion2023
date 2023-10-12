//
//  ContentView.swift
//  Pedometer 2023
//
//  Created by Michael Prenez-Isbell on 10/12/23.
//

import SwiftUI
import CoreMotion



struct ContentView: View {
    @StateObject private var viewModel = ContentViewModel()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}


final class ContentViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
 
    var activityManager: CMMotionActivityManager?
    /// Provides to create an instance of the CMPedometer.
    var pedometer: CMPedometer?
    
    func checkIfMotionServicesAvailableOnThisDevice() {
        if CMMotionActivityManager.isActivityAvailable()  {
            
        }
       
    }
}
    
import CoreMotion
/// Provides to create an instance of the CMMotionActivityManager.


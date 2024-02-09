//
//  ContentView.swift
//  BetterRest
//
//  Created by Ercan Kabali on 8.02.2024.
//

import SwiftUI
import CoreML


struct ContentView: View {
    
    @State private var wakeUp = Date.now
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    var body: some View {
        
        NavigationStack {
            VStack{
                Text("When do you want to wake up ?")
                    .font(.headline)
                DatePicker("Please Enter a time", selection: $wakeUp,displayedComponents: .hourAndMinute)
                    .labelsHidden()
                Text("Desired amount of sleep")
                    .font(.headline)
                Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount,in: 4...12,step: 0.25)
                Text("Daily Coffee Intake")
                    .font(.headline)
                Stepper("\(coffeeAmount) cup(s)", value: $coffeeAmount,in: 1...20)
                    
            }
            .navigationTitle("BetterRest")
            .toolbar {
                Button("Calculate",action: calculateBedTime)
            }
            .padding()
        }
        
    }
    
    func calculateBedTime(){
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
        }catch {
            
        }
    }
    
}

#Preview {
    ContentView()
}

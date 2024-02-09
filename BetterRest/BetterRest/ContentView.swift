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
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
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
                Spacer()
                    
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
            
            let components = Calendar.current.dateComponents([.hour,.minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            
            let prediction = try model.prediction(wake: Int64(Double(hour + minute)), estimatedSleep: sleepAmount, coffee: Int64(Double(coffeeAmount)))
            let sleepTime = wakeUp - prediction.actualSleep
            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
                
        }catch {
            alertTitle = "Your ideal bedtime is…"
            
            
            
        }
    }
    
}

#Preview {
    ContentView()
}

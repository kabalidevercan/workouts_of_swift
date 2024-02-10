//
//  ContentView.swift
//  BetterRest
//
//  Created by Ercan Kabali on 8.02.2024.
//

import SwiftUI
import CoreML


struct ContentView: View {
    
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    static var defaultWakeTime:Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? .now
    }
    
    var body: some View {
        
        NavigationStack {
            VStack{
                Section{
                    DatePicker("Please Enter a time", selection: $wakeUp,displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }header: {
                    Text("When do you want to wake up")
                        .font(.headline)
                }
                .padding()
                
                ///////////
                Section{
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount,in: 4...12,step: 0.25)
                }header: {
                    Text("Desired amount of sleep")
                        .font(.headline)
                }
                .padding()
                //////
                
                Section{
                    
                    Picker("1 cup",selection: $coffeeAmount){
                        ForEach(0..<21){
                            number in
                            if number <= 1 {
                                Text("\(number) cup")
                            }else {
                                Text("\(number) cups")
                            }
                        }
                    }
                    
                }header: {
                    Text("Daily Coffee Intake")
                        .font(.headline)
                }
                
                
                
                    /////
                Spacer()
                    
            }
            .navigationTitle("BetterRest")
            .toolbar {
                Button("Calculate",action: calculateBedTime)
                    
            }
            .alert(alertTitle,isPresented: $showingAlert){
                Button("OK"){}
            }message: {
                Text(alertMessage)
            }
        }
        
    }
    
    func calculateBedTime(){
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour,.minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            
            let prediction = try model.prediction(wake: Int64((hour+minute)), estimatedSleep: sleepAmount, coffee: Int64(coffeeAmount))
            
            
            let sleepTime = wakeUp - prediction.actualSleep
            
            alertTitle = "Your ideal bedtime is…"
            
            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
                
        }catch {
            
            alertTitle = "Error!!!! "
            
            alertMessage = "Sorry,there was a problem calculating your bedtime  "
            
            
            
        }
        
        showingAlert = true
    }
    
}

#Preview {
    ContentView()
}

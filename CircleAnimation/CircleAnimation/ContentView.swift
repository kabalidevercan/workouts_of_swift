//
//  ContentView.swift
//  CircleAnimation
//
//  Created by Ercan Kabali on 15.02.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 1.0

    var body: some View {
        
        ZStack{
            LinearGradient(colors: [.cyan,.black], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack{
           
            
            HStack{
                Text("Get the premium version on KBLSoftware")
                    .font(.system(size: 20))
                    
                Spacer()
                Image(systemName: "checkmark.circle.fill")
                .padding(15)
                .font(.footnote)
                .background(.ultraThickMaterial)
                .foregroundStyle(.red)
                .clipShape(.circle)
                .overlay(
                    Circle()
                        .stroke(.red)
                        .scaleEffect(animationAmount)
                        .opacity(1.7 - animationAmount)
                        .animation(
                            .easeInOut(duration: 3)
                            .repeatForever(autoreverses: false),
                            value: animationAmount
                        )
                )
                .onAppear {
                    animationAmount = 2
                }
                
                
            }
            .padding()
            .background(.ultraThickMaterial,in:RoundedRectangle(cornerRadius: 20 ,style: .continuous))
            Spacer()
            
        }
            
            
        }
        
        
    }
}
#Preview {
    ContentView()
}


/*
 ZStack{
     LinearGradient(colors: [.cyan,.yellow], startPoint: .top, endPoint: .bottom)
         .ignoresSafeArea()
     VStack{
         Spacer()
         Button("Tap Me") {
             // animationAmount += 1
         }
         .padding(35)
         .background(.red)
         .foregroundStyle(.white)
         .clipShape(.circle)
         .overlay(
             Circle()
                 .stroke(.red)
                 .scaleEffect(animationAmount)
                 .opacity(2 - animationAmount)
                 .animation(
                     .easeInOut(duration: 3)
                         .repeatForever(autoreverses: false),
                     value: animationAmount
                 )
         )
         .onAppear {
             animationAmount = 2
         }

     }
 }
 */



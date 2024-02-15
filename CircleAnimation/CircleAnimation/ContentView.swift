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
        
        
    }
}
#Preview {
    ContentView()
}

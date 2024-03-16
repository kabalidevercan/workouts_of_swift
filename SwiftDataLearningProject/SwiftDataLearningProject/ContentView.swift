//
//  ContentView.swift
//  SwiftDataLearningProject
//
//  Created by Ercan Kabali on 14.03.2024.
//

import SwiftUI
import SplineRuntime

struct ContentView: View {
    
    var body: some View {
        
        VStack{
                Rectangle()
                .frame(height: 500)
                .ignoresSafeArea()
        }
        VStack(spacing:12){
            Text("Build Your Brand")
                .font(.title.bold())
            Text("Stay up to date with all your social media platforms in one simple app.")
        }
        .padding(.horizontal)
        
        Spacer()
        
        Button("Get Started"){
            //BUTTON ACTION CODE GOES HERE
        }
        .buttonStyle(.borderedProminent)
        .tint(.pink)
        
        Spacer()
    
    }
}

#Preview {
    ContentView()
        
}


struct Onboard3DView:View{
    var body: some View{

        // fetching from cloud
        let url = URL(string: "https://build.spline.design/gXANx0NEHXsi2H5zc4l5/scene.splineswift")!

        // // fetching from local
        // let url = Bundle.main.url(forResource: "scene", withExtension: "splineswift")!

        try? SplineView(sceneFileURL: url)
    }
}

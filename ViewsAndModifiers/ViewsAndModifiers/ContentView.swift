//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Ercan Kabali on 7.02.2024.
//

import SwiftUI


struct CreateModifierLo: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(.red)
            .clipShape(.rect(cornerRadius: 12))
    }
}



struct CapsuleText: View {
    var text: String

    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .foregroundStyle(.white)
            .background(.blue)
            .clipShape(.capsule)
    }
}



struct ContentView: View {
    
    var body: some View {
        VStack(spacing:10){
            CapsuleText(text: "Hello")
            CapsuleText(text: "Text")
                .modifier(CreateModifierLo())
        }
       
    }
}

#Preview {
    ContentView()
}

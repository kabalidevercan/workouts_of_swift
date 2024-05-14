//
//  ContentView.swift
//  AccessibilitySandbox
//
//  Created by Ercan Kabali on 14.05.2024.
//

import SwiftUI

         
struct ContentView: View {
  var body: some View {
    VStack {
      Button(action: {
        // Perform an action when the button is pressed
      }) {
        Text("Tap Me")
      }
      .accessibilityLabel(Text("Press the button to execute an action"))
    }
  }
}


#Preview {
    ContentView()
}

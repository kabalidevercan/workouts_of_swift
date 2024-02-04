//
//  ContentView.swift
//  WeSplit
//
//  Created by Ercan Kabali on 4.02.2024.
//

import SwiftUI


struct ContentView: View {
    let students = ["Hatice", "Mehmet", "Ramiz"]
    @State private var selectedStudent = "Hatice"

    var body: some View {
        NavigationStack {
            Form {
                Picker("Select your student", selection: $selectedStudent) {
                    ForEach(students, id: \.self) {
                        Text($0)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

//
//  AstronautView.swift
//  MoonShot
//
//  Created by Ercan Kabali on 26.02.2024.
//

import SwiftUI

struct AstronautView: View {
    let role:String
    let astronaut: Astronaut

    
    
    var body: some View {
        ScrollView {
            VStack(alignment:.leading){
                Image(astronaut.id)
                    .resizable()
                    .scaledToFit()
                Text(role)
                    .padding()
                    
                
                Text(astronaut.description)
                    .padding()
            }
        }
        .background(.darkBackground)
        .navigationTitle(astronaut.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let astronauts: [String:Astronaut]  = Bundle.main.decode("astronauts.json")
    
    
    return AstronautView(role:"ERE",astronaut: astronauts["aldrin"]!)
        .preferredColorScheme(.dark)
}

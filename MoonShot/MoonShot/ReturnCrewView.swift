//
//  ReturnCrewView.swift
//  MoonShot
//
//  Created by Ercan Kabali on 27.02.2024.
//

import SwiftUI

struct ReturnCrewView: View {
    
    struct CrewMember{
        let role:String
        let astronaut:Astronaut
    }
    
    
    let mission:Mission
    let crew:[CrewMember]
    
    
    init(mission:Mission,astronauts:[String:Astronaut]){
        
        self.mission = mission
        
        self.crew = mission.crew.map{member in
            
            if let astronaut = astronauts[member.name]{
                return CrewMember(role: member.role, astronaut: astronaut)
            }else {
                fatalError("Missing \(member.name)")
            }
        }
    }
    
    
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    let missions:[Mission] = Bundle.main.decode("missions.json")
    let astronauts:[String:Astronaut]  = Bundle.main.decode("astronauts.json")
    
   return ReturnCrewView(mission: missions[1], astronauts:astronauts )
        .preferredColorScheme(.dark)
}

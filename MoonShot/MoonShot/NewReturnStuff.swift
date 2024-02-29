//
//  NewReturnStuff.swift
//  MoonShot
//
//  Created by Ercan Kabali on 27.02.2024.
//

import Foundation



struct NewReturnStuff {
    
    struct CrewMember{
        
        let role:String
        let astronaut:Astronaut
    }
    
    
    private let mission:Mission
   private  let crews:[CrewMember]
    
    init(mission:Mission, astronauts:[String:Astronaut]){
        self.mission = mission
        
        self.crews = mission.crew.map{member in
            if let astronaut =  astronauts[member.name]{
                return CrewMember(role: member.role, astronaut: astronaut)
            }else{
                fatalError("Missing the user that is \(member.name)")
            }
        }
    }
    
    /*
     init(mission:Mission,astronauts:[String:Astronaut]){
         self.mission = mission
         
         self.crews = mission.crew.map{memberOfCrew in
             if let astronaut = astronauts[memberOfCrew.name]{
                 return CrewMember(role: memberOfCrew.role, astronaut: astronaut)
             }else{
                 fatalError("Missing \(memberOfCrew.name)")
             }
             
         }
         
     }
     
     */
   
    
    var getNewMission:Mission{
        mission
    }
    
    var getAllCrew:[CrewMember]{
        crews
    }
    

}

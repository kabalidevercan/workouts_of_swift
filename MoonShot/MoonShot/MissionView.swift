//
//  MissionView.swift
//  MoonShot
//
//  Created by Ercan Kabali on 25.02.2024.
//

import SwiftUI



struct MissionView: View {
    
    
    let newObjFromNewReturnStuff:NewReturnStuff
    
    
    init(mission:Mission,astronauts:[String:Astronaut]){
        newObjFromNewReturnStuff = NewReturnStuff(mission: mission, astronauts: astronauts)
    }
    
    
    /*init(mission:Mission,astronauts:[String:Astronaut]){
     self.mission = mission
     
     self.crew = mission.crew.map{member in
         if let astronaut = astronauts[member.name]{
             return CrewMember(role: member.role, astronaut: astronaut)
         }else {
             fatalError("Missin \(member.name)")
         }
     }
 }
     
     */
    var body: some View {
        ScrollView{
            VStack{
                Image(newObjFromNewReturnStuff.getNewMission.image)
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(.horizontal){width,axis in
                        width * 0.5
                    }
                VStack(alignment:.leading){
                    Text(newObjFromNewReturnStuff.getNewMission.formattedLaunchDate)
                        .font(.title.bold())
                        .padding(.top)
                    Rectangle()
                        .frame(height: 2)
                        .foregroundStyle(.lightBackground)
                        .padding(.vertical)
                    
                    Text("Mission Highlights")
                        .font(.title.italic())
                        .padding(.bottom,5)
                    
                    
                    
                    Rectangle()
                        .frame(height: 2)
                        .foregroundStyle(.lightBackground)
                        .padding(.vertical)
                    
                    Text("Crew")
                        .font(.title.bold())
                        .padding(.bottom,5)
                }
                .padding(.horizontal)

                //Crew memberlari gosteren alan
                
                
               
                
            }
        }
        .navigationTitle(newObjFromNewReturnStuff.getNewMission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
        
}

#Preview {
    let missions:[Mission] = Bundle.main.decode("missions.json")
    let astronauts:[String:Astronaut] = Bundle.main.decode("astronauts.json")
    
   return  MissionView(mission: missions[1],astronauts: astronauts)
        .preferredColorScheme(.dark)
            
}

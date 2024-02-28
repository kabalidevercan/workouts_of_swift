//
//  NewReturnScrollView.swift
//  MoonShot
//
//  Created by Ercan Kabali on 28.02.2024.
//

import SwiftUI

struct NewReturnScrollView: View {
    
    
    
    let newObject:NewReturnStuff
    
    init(mission:Mission,astronauts:[String:Astronaut]){
        
        newObject = NewReturnStuff(mission: mission, astronauts: astronauts)
        
        
    }
    
    
    
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false){
            HStack{
                ForEach(newObject.crews,id:\.role){
                    newCrew in
                    NavigationLink{
                        AstronautView(role: newCrew.role, astronaut: newCrew.astronaut)
                    }label: {
                        Text("Tap")
                    }
                    
                    
                }
            }
        }

    }
}

#Preview {
    
    
    
    NewReturnScrollView()
}


/*
 ScrollView(.horizontal,showsIndicators:false){
     HStack{
         ForEach(crew,id: \.role){memberOfCrew in
             NavigationLink{
                 AstronautView(role: memberOfCrew.role
                               , astronaut: memberOfCrew.astronaut)
             }label: {
                 HStack{
                     Image(memberOfCrew.astronaut.id)
                         .resizable()
                         .frame(width:104,height: 72)
                         .clipShape(.capsule)
                         .overlay(
                             Capsule()
                                 .strokeBorder(.white,lineWidth:1)
                         )
                     VStack(alignment:.leading){
                         Text(memberOfCrew.astronaut.name)
                             .foregroundStyle(.white)
                             .font(.headline)
                             
                         Text(memberOfCrew.role)
                             .foregroundStyle(.gray)
                     }
                         
                 }
                 .padding(.horizontal)
             }
         }
     }
 }
 
 */

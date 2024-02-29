//
//  NewReturnScrollView.swift
//  MoonShot
//
//  Created by Ercan Kabali on 28.02.2024.
//

import SwiftUI

struct NewReturnScrollView: View {
    
    struct CrewMember{
        
        let role:String
        let astronaut:Astronaut
    }
    
    let crews:[CrewMember]
    
    
    init(crews:[CrewMember]){
        self.crews = crews
    }
    
    
    var body:some View{
        ScrollView(.horizontal,showsIndicators:false){
            HStack{
                ForEach(crews,id: \.role){memberOfCrew in
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
        .padding(.bottom)
        
        
    }
    
    
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

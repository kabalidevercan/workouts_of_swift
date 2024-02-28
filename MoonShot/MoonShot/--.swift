//
//  HorizontalScrollView.swift
//  MoonShot
//
//  Created by Ercan Kabali on 27.02.2024.
//

import SwiftUI

struct HorizontalScrollView: View {
    
   
    
    
    
    var body: some View {
            
       Text("Will")
    }
        
    }

#Preview {
    HorizontalScrollView()
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

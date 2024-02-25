//
//  ContentView.swift
//  MoonShot
//
//  Created by Ercan Kabali on 21.02.2024.
//

import SwiftUI

struct ContentView : View{

    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    let astronauts:[String:Astronaut] = Bundle.main.decode("astronauts.json")
        
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    

    var body: some View{
        NavigationStack{
            ScrollView{
                LazyVGrid(columns:columns){
                    ForEach(missions){mission in
                        NavigationLink{
                            MissionView(mission: mission, astronauts: astronauts)
                        }label: {
                            VStack{
                                Image(mission.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100,height: 100)
                                    .padding()
                                VStack{
                                    Text(mission.displayName)
                                        .font(.headline)
                                        .foregroundStyle(.white)
                                        
                                    Text(mission.formattedLaunchDate)
                                        .font(.headline)
                                        .foregroundStyle(.gray)
                                }
                                .padding(.vertical)
                                .frame(maxWidth:.infinity)
                                .background(.lightBackground)
                            }
                            .clipShape(.rect(cornerRadius: 10))
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(.lightBackground,lineWidth:10))
                        }
                    }
                    .padding([.horizontal,.bottom])
                }
                
            }
            .navigationTitle("MoonShot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
        }
    }
    

    

    
    
 
}


#Preview {
    ContentView()
}
    



/*
 
 */

//
//  ContentView.swift
//  MoonShot
//
//  Created by Ercan Kabali on 21.02.2024.
//

import SwiftUI

struct ContentView : View{
    
   let columns = [
    GridItem(.adaptive(minimum: 150))
   ]
    
    let astronauts : [String:Astronaut] = Bundle.main.decode("astronauts.json")
    
    let missions: [Mission] = Bundle.main.decode("missions.json")
    

    
    
    var body: some View{
        NavigationStack{
            ScrollView{
                LazyVGrid(columns:columns){
                    ForEach(missions){mission in
                        NavigationLink{
                            Text("It is showing details right now!!")
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
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(.lightBackground))
                            
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
    




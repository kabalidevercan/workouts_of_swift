//
//  EmojiRating.swift
//  KitapKurdu
//
//  Created by Ercan Kabali on 12.03.2024.
//

import SwiftUI

struct EmojiRating: View {
    
    @Binding var numberOfRate:Int
    @Binding  var number:Int
    
    
    let maxRate = 5
    @State var imageOn = Image(systemName: "person")
    
    let offColor = Color.gray
    let onColor = Color.yellow
    
    
    
    
    
    
    
    var body: some View {
       
        
        var imageOn: Image{
            
            switch numberOfRate {
            case 0:
                return Image(systemName: "fan.floor")
            case 1:
                return Image(systemName: "car")
            case 2:
                return Image(systemName: "star")
            case 3:
                return Image(systemName: "person")
            default:
                return Image(systemName: "flame")
            }
        }
        
        
        switch numberOfRate{
        case 1:
            VStack(alignment:.leading){
                    Text("Car Rate")
                    HStack{
                        ForEach(1..<maxRate + 1,id: \.self){sayi in
                            Button{
                                number = sayi
                            }label: {
                                
                                imageOn
                                foregroundStyle(sayi > number ? offColor : onColor)
                            }
                        }
                    }
                    .buttonStyle(.plain)
                }
            
        case 2:
            VStack(alignment:.leading){
                Text("Smile Rate")
                HStack{
                    ForEach(1..<maxRate + 1,id: \.self){sayi in
                        Button{
                            number = sayi
                        }label: {
                            imageOn
                                .foregroundStyle(sayi > number ? offColor : onColor)
                        }
                    }
                }
                .buttonStyle(.plain)
            }
        case 3:
            VStack(alignment:.leading){
                Text("Star Rate")
                HStack{
                    ForEach(1..<maxRate + 1,id: \.self){sayi in
                        Button{
                            number = sayi
                        }label: {
                            imageOn
                                .foregroundStyle(sayi > number ? offColor : onColor)
                        }
                    }
                }
                .buttonStyle(.plain)
            }
        case 4:
            VStack(alignment:.leading){
                Text("Person Rate")
                HStack{
                    ForEach(1..<maxRate + 1,id: \.self){sayi in
                        Button{
                            number = sayi
                        }label: {
                        
                            imageOn
                                .foregroundStyle(sayi > number ? offColor : onColor)
                        }
                    }
                }
                .buttonStyle(.plain)
            }
            
        default:
            VStack(alignment:.leading){
                Text("Person Rate")
                HStack{
                    ForEach(1..<maxRate + 1,id: \.self){sayi in
                        Button{
                            number = sayi
                        }label: {
                        
                            imageOn
                                .foregroundStyle(sayi > number ? offColor : onColor)
                        }
                    }
                }
                .buttonStyle(.plain)
            }

        }
    }
}

#Preview {
    EmojiRating(numberOfRate: .constant(1), number: .constant(1))
}

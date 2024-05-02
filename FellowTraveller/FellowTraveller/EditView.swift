//
//  EditView.swift
//  FellowTraveller
//
//  Created by Ercan Kabali on 2.05.2024.
//

import SwiftUI

struct EditView: View {
    
    var onSave: (Location) -> Void
    
    @Environment(\.dismiss) var dismiss
    
    var location:Location
    @State private var name:String
    @State private var description:String
    
    init(location:Location,onSave: @escaping (Location) -> Void){
        self.location = location
        self.onSave = onSave
        
        _name = State(initialValue: location.name)
        _description = State(initialValue: location.description)
    }
    
    
    
    
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    TextField("Place name",text: $name)
                    TextField("Description",text: $description)
                }
            }
            .navigationTitle("Place Details")
            .toolbar{
                Button("Save"){
                 var newLocation = location
                    newLocation.id = UUID()
                    newLocation.name = name
                    newLocation.description = description
                    
                    onSave(newLocation)
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    EditView(location: .example){_ in}
}

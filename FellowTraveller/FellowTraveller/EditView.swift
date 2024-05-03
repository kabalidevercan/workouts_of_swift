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
    @State private var loadingState = LoadingState.loading
    @State private var pages = [Page]()
    
    
    init(location:Location,onSave: @escaping (Location) -> Void){
        self.location = location
        self.onSave = onSave
        
        _name = State(initialValue: location.name)
        _description = State(initialValue: location.description)
    }
    
    
    enum LoadingState {
        case loading,loaded,failed
    }

    
    func fetchNearbyPlaces() async {
        let urlString = "https://en.wikipedia.org/w/api.php?ggscoord=\(location.latitude)%7C\(location.longitude)&action=query&prop=coordinates%7Cpageimages%7Cpageterms&colimit=50&piprop=thumbnail&pithumbsize=500&pilimit=50&wbptterms=description&generator=geosearch&ggsradius=10000&ggslimit=50&format=json"

        guard let url = URL(string: urlString) else {
            print("Bad URL: \(urlString)")
            return
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)

            // we got some data back!
            let items = try JSONDecoder().decode(Result.self, from: data)

            // success – convert the array values to our pages array
            pages = items.query.pages.values.sorted { $0.title < $1.title }
            loadingState = .loaded
        } catch {
            // if we're still here it means the request failed somehow
            loadingState = .failed
        }
    }
    
    
    
    var body: some View {
        
        NavigationStack{
            Form{
                Section{
                    TextField("Place name",text: $name)
                    TextField("Description",text: $description)
                }
                
                Section("Nearby..."){
                    switch loadingState {
                        
                    case .loaded:
                        ForEach(pages,id: \.pageId){page in
                            Text(page.title)
                                .font(.headline)
                        }
                        
                    case .loading:
                        Text("Loading...")
                
                        
                    case .failed:
                        Text("It's failed, try it later")
                    
                        
                        
                    }
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

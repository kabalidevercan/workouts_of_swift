//
//  FellowTravellerForYou.swift
//  FellowTraveller
//
//  Created by Ercan Kabali on 2.05.2024.
//

import SwiftUI
import MapKit


struct FellowTravellerForYou: View {
    
    @State private var selectedPlace:Location?
    @State private var locations = [Location]()
    
    let startPosition = MapCameraPosition.region(
        MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 56, longitude: -3), span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10))
    )
    
    var body: some View {
        
        MapReader{proxy in
            Map(initialPosition: startPosition){
                ForEach(locations){location in
                    
                    Annotation(location.name,coordinate: location.coordinate){
                        Image(systemName: "map.circle.fill")
                            .resizable()
                            .foregroundStyle(.red.opacity(0.6))
                            .frame(width: 44,height: 44)
                            .onLongPressGesture{
                                selectedPlace = location
                            }
                    }
                }
            }
            .onTapGesture {position in
                if let coordinate = proxy.convert(position,from: .local){
                    let newLocation = Location(id: UUID(), name: "New Location", description: "", latitude: coordinate.latitude, longitude: coordinate.longitude)
                    locations.append(newLocation)
                    print("\(coordinate.latitude) ve \(coordinate.longitude)")
                }
            }
            .sheet(item:$selectedPlace){place in
                EditView(location: place){newLocation in
                    if let index = locations.firstIndex(of: place){
                        locations[index] = newLocation
                    }
                }
            }
            .mapStyle(.hybrid)
            
            
                
            
        }
       
        
    }
}

#Preview {
    FellowTravellerForYou()
}



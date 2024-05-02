//
//  BabuBabu.swift
//  FellowTraveller
//
//  Created by Ercan Kabali on 30.04.2024.
//

import SwiftUI
import MapKit

struct BabuBabu: View {
    
    enum LoadingState{
        case loading,success,failed
    }
    
    @State private var loadingState = LoadingState.loading
    
    let locations = [
        NewLocation(name: "Buckingham Palace", coordinate: CLLocationCoordinate2D(latitude: 51.501, longitude: -0.141)),
        NewLocation(name: "Tower Of London", coordinate: CLLocationCoordinate2D(latitude: 51.508, longitude: -0.076))
    ]
    
    @State private var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275),
            span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
        )
    )
    
    /*
     let positionTwo  = MapCameraPosition.region(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)))
     */
    
    

    
    var body: some View {
       
        MapReader {proxy in
            
            Map()
                .onTapGesture {position in
                    if let coordinate = proxy.convert(position, from:.local){
                        print(coordinate)
                    }
                    
                }
            
            
        }
        
     
        
            
        /**
         if loadingState == .loading {
             LoadingView()
         } else if loadingState == .success {
             SuccessView()
         } else if loadingState == .failed {
             FailedView()
         }
         
         */
    }
}



#Preview {
    BabuBabu()
}


struct NewLocation:Identifiable {
    let id = UUID()
    var name :String
    var coordinate:CLLocationCoordinate2D
}

struct LoadingView : View {
    var body: some View{
        Text("Loading...")
    }
}


struct SuccessView : View {
    var body: some View{
        Text("Success...")
    }
}

struct FailedView:View {
    var body: some View{
        Text("Failed...")
    }
}

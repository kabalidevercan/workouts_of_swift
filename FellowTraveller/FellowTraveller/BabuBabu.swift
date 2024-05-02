//
//  BabuBabu.swift
//  FellowTraveller
//
//  Created by Ercan Kabali on 30.04.2024.
//

import SwiftUI
import MapKit

struct BabuBabu: View {
    @State private var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275),
            span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
        )
    )
    
    
    enum LoadingState{
        case loading,success,failed
    }
    
    @State private var loadingState = LoadingState.loading
    
    var body: some View {
       
        Map(position: $position)
        
            
        if loadingState == .loading {
            LoadingView()
        } else if loadingState == .success {
            SuccessView()
        } else if loadingState == .failed {
            FailedView()
        }
    }
}

#Preview {
    BabuBabu()
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

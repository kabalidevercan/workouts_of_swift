//
//  MapView.swift
//  tests on SwiftUI
//
//  Created by Ercan Kabali on 31.01.2024.
//

import SwiftUI
import MapKit


struct MapView: View {
    var body: some View {
        Map(initialPosition: .region(region))
    }
    private var region:MKCoordinateRegion {
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude:41.1888791 , longitude: 27.7796163), span: MKCoordinateSpan(latitudeDelta: 0.004, longitudeDelta: 0.004)
        )
    }
}

#Preview {
    MapView()
}

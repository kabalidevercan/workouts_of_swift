//
//  CombineOfLearneds.swift
//  tests on SwiftUI
//
//  Created by Ercan Kabali on 31.01.2024.
//

import SwiftUI
import MapKit

struct CombineOfLearneds: View {
    var body: some View {
        VStack {
            Map(initialPosition: .region(region))
            ZStack(alignment:.bottom) {
                VStack(alignment:.leading){
                    Text("KBL Software Center")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    HStack {
                        Text("You will reach to success with Us")
                            .font(.subheadline)
                        
                        Spacer()
                        Text("Ergene")
                            .font(.subheadline)
                        
                    }
                } .padding()
            }
        }
    }
    
    private var region:MKCoordinateRegion {
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude:41.1888791 , longitude: 27.7796163), span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        )
    }
    
    
}

#Preview {
    CombineOfLearneds()
}

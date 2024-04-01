//
//  GetAppStoreReview.swift
//  FilterImage
//
//  Created by Ercan Kabali on 1.04.2024.
//

import SwiftUI
import StoreKit

struct GetAppStoreReview: View {
    @Environment(\.requestReview) var requestReview
    
    
    var body: some View {
        Button("Leave a review"){
            requestReview()
        }
    }
}

#Preview {
    GetAppStoreReview()
}

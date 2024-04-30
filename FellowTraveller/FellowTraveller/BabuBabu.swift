//
//  BabuBabu.swift
//  FellowTraveller
//
//  Created by Ercan Kabali on 30.04.2024.
//

import SwiftUI

struct BabuBabu: View {
    
    enum LoadingState{
        case loading,success,failed
    }
    
    @State private var loadingState = LoadingState.loading
    
    var body: some View {
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

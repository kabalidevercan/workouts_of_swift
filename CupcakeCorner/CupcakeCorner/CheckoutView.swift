//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Ercan Kabali on 5.03.2024.
//

import SwiftUI

struct CheckoutView: View {
    var order:Order
    
    var body: some View {
        ScrollView{
            VStack{
                AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"),scale: 3){
                    phase in
                    
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFit()
                    }else if phase.error != nil {
                        fatalError("Error row 24 in CheckoutView")
                    }else{
                        ProgressView()
                    }
                    
                }
                .frame(height: 233)
                
                Text("Your total cost is: \(order.cost,format: .currency(code: "USD"))")
                Button("Place order",action: {})
                    .padding()
                
            }
        }
        .navigationTitle("Check Out")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    CheckoutView(order: Order())
}

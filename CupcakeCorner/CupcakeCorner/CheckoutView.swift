//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Ercan Kabali on 5.03.2024.
//

import SwiftUI

struct CheckoutView: View {
    
    var order:Order
    @State private var confirmationMessage = ""
    @State private var showingConfirmation = false
    
    
    
    func placeOrder() async {
        
        guard let encoded = try? JSONEncoder().encode(order) else{
            print("Failed to encode order 16.row in CheckoutView")
            return
        }
        
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        
        
        do{
            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
            let decodedOrder = try JSONDecoder().decode(Order.self, from: data)
            confirmationMessage = "Your order for \(decodedOrder.quantity) x \(Order.types[decodedOrder.type].lowercased())"
            showingConfirmation = true
            
        }catch{
            print("Checkout Failed: \(error.localizedDescription)")
        }
        
        
    }
     
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
                
                Button("Place order"){
                    Task{
                        await placeOrder()
                    }
                }
                    .padding()
                    .frame(width: 150,height: 50)
                    .background(.gray.opacity(0.8))
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                
            }
        }
        .navigationTitle("Check Out")
        .alert("Thank you",isPresented: $showingConfirmation){
            Button("OK"){}
        }message: {
            Text(confirmationMessage)
        }
        .navigationBarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize)
    }
    
  
    
    
    
}

#Preview {
    CheckoutView(order: Order())
}

import SwiftUI



struct ContentView : View{
    
    @State private var order = Order()
    
    var body: some View{
        NavigationStack{
            Form{
                Section{
                    Picker("Select your cake type",selection: $order.type){
                        ForEach(Order.types.indices,id: \.self){ type in
                                Text("\(type)")
                        }
                    }
                    
                    Stepper("Number of cakes: \(order.quantity)",value: $order.quantity, in: 3...20)
                }
                
                Section{
                    Toggle("Any special requests?",isOn: $order.speacialRequestEnabled)
                    
                    
                    if order.speacialRequestEnabled{
                        Toggle("Add extra frosting",isOn: $order.extraFrosting)
                        Toggle("Add extra sprinkles",isOn: $order.addSprinkles)
                    }
                    
                }
                
                Section{
                    NavigationLink("Delivery Details"){
                        AddressView(order: order)
                    }
                }
                
            }
            .navigationTitle("Get a Cup Cake")
        }
    }
}

#Preview {
    ContentView()
}


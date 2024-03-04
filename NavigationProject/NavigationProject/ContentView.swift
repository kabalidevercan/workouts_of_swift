 import SwiftUI




struct ContentView:View {
    var body: some View {
        NavigationStack {
            List(0..<100) { i in
                Text("Row \(i)")
            }
            .navigationTitle("Title goes here")
            .navigationBarTitleDisplayMode(.large)
            .toolbarBackground(.blue)
            .toolbarColorScheme(.dark)
            .toolbar(.hidden,for: .bottomBar)
            .toolbar{
                
                ToolbarItem(placement: .topBarTrailing){
                    Button("ekle"){
                        
                    }
                }
                
            }
            
        }
    }
}





#Preview{
    ContentView()
}

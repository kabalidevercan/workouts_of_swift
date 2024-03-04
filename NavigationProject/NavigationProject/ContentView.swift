 import SwiftUI




struct ContentView:View {
    
    @State private var title = "BSH"
    
    var body: some View {
        NavigationStack {
            List(0..<100) { i in
                Text("Row \(i)")
            }
            .navigationTitle($title)
            .navigationBarTitleDisplayMode(.large)
            .toolbarBackground(.gray.opacity(0.8))
            .toolbarColorScheme(.dark)
            .toolbar{
                
                ToolbarItemGroup(placement:.topBarTrailing){
                    Button("Ekle"){
                        
                    }
                    
                    Button("Exit"){}
                }
                
            }
            
        }
    }
}





#Preview{
    ContentView()
}

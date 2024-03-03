//
//  ContentView.swift
//  NavigationProject
//
//  Created by Ercan Kabali on 26.02.2024.
//

import SwiftUI


/*

struct ContentView:View{
    
    @State private var newPath = [NavigationPath]()
    
    
    
    var body: some View{
        NavigationStack(path:$newPath){
            ScrollView{
                Button("Create a random number"){
                    new
                }
            }
            .navigationDestination(for: Int.self){selectedItem in
                    Text("You are on the \(selectedItem)")
                
            }
        }
    }
    
    
}
 
 */


/*


struct SecondView:View{
    
    var  number : Int
    
    @Binding var newPathInSecondView:NavigationPath

    var body: some View{
        
        Button("Create a random number and down"){
            let newValue = Int.random(in: 1...1000)
            newPathInSecondView.append(newValue)
        }
        .frame(width: 200,height: 100)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .foregroundStyle(.white)
        .background(.black)
        
            .navigationTitle("Number: \(number)")
        if !newPathInSecondView.isEmpty {
            Button("Back to home page"){
                newPathInSecondView = NavigationPath()
            }
            .frame(width: 200,height: 100)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .foregroundStyle(.white)
            .background(.black)
        }
        
    }
}


struct ContentView:View {
    
    
    @State private var newPath = NavigationPath()
    
    var body: some View{
        NavigationStack(path:$newPath){
            SecondView(number: 0,newPathInSecondView: $newPath)
                .navigationDestination(for: Int.self){ createdRandomNumber in
                    SecondView(number: createdRandomNumber,newPathInSecondView: $newPath)
                }
        }
        
    }
}

*/



    struct ContentView: View {
        @State private var isActionSheetPresented = false
        
        var body: some View {
            NavigationStack{
                NavigationLink(destination: Text("Detail")){
                    
                }
            }
        }
    }

    
    
    
    /*
     struct User:Hashable{
     let name:String
     let surname:String
     let address:String
     
     init(name:String,surname:String,address:String){
     self.name = name
     self.surname = surname
     self.address = address
     
     print("User class is working")
     
     }
     }
     
     
     struct  NewRandomView:View{
     
     var number:Int
     @Binding var path :[Int]
     
     var body: some View{
     NavigationLink("Go to random number",value: Int.random(in: 1...100))
     .navigationTitle("Number: \(number)")
     
     if(!path.isEmpty){
     Button("Back to home"){
     path.removeAll()
     }
     .foregroundStyle(.white)
     .frame(width: 200,height: 100)
     .background(.linearGradient(colors: [.red.opacity(0.4),.blue.opacity(0.7)], startPoint: .bottomTrailing, endPoint: .topTrailing))
     .clipShape(RoundedRectangle(cornerRadius: 20))
     .padding(.top,50)
     }
     }
     }
     
     
     
     
     
     
     struct ContentView:View{
     
     @State private var yol = [Int]()
     
     var body: some View{
     NavigationStack(path:$yol){
     NewRandomView(number: 59, path: $yol)
     .navigationDestination(for: Int.self){IntValue in
     NewRandomView(number: IntValue, path: $yol)
     }
     }
     }
     
     }
     
     
     
     /*
      
      struct ContentView: View {
      
      
      @State private var users = NavigationPath()
      
      
      var body: some View {
      NavigationStack(path:$users){
      ScrollView(){
      Button("Get info for Irem"){
      users.append(User(name: "Irem", surname: "Erdem", address: "Turkey"))
      }
      .foregroundStyle(.white)
      .frame(width:200,height: 100)
      .background(.black)
      .clipShape(RoundedRectangle(cornerRadius: 20))
      .padding(.bottom,40)
      
      Button("Create a user for Ercan"){
      users.append(User(name: "Ercan", surname: "Kabali", address: "Turkey"))
      }
      .foregroundStyle(.white)
      .frame(width: 200,height: 100)
      .background(.black)
      .clipShape(RoundedRectangle(cornerRadius: 20))
      .padding(.bottom,40)
      Button("Get information for A Team"){
      users.append(User(name: "Mehmet", surname: "Celi", address: "Turkey"))
      users.append(User(name: "Zaara", surname: "Khan", address: "India"))
      }
      .foregroundStyle(.white)
      .frame(width: 200,height: 100)
      .background(.black)
      .clipShape(RoundedRectangle(cornerRadius: 20))
      .padding(.bottom,40)
      ForEach(0..<5){i in
      Button("Create a number that is \(i)"){
      users.append(i)
      }
      .foregroundStyle(.white)
      .frame(width: 200,height: 100)
      .background(.black)
      .clipShape(RoundedRectangle(cornerRadius: 20))
      
      }
      .frame(maxWidth: .infinity)
      }
      .navigationDestination(for: User.self){selectedUser in
      Text("You are able to see about \(selectedUser.name) \(selectedUser.surname),\(selectedUser.address)")
      }
      .navigationDestination(for: Int.self){createdInt in
      Text("You created a \(createdInt)")
      }
      }
      }
      }
      
      */
     */
    
    

    #Preview {
        ContentView()
    }
    
    


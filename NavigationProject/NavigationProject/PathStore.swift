//
//  PathStore.swift
//  NavigationProject
//
//  Created by Ercan Kabali on 1.03.2024.
//

import Foundation
import SwiftUI

/*
@Observable
class PathStore {
    var path:  NavigationPath{
        didSet {
            save()
        }
    }

    private let savePath = URL.documentsDirectory.appending(path: "SavedPath")

    

    
    
    init() {
        if let data = try? Data(contentsOf: savePath) {
            if let decoded = try? JSONDecoder().decode(NavigationPath.CodableRepresentation.self, from: data) {
                path = decoded
                return
            }
        }

        // Still here? Start with an empty path.
        path = []
    }

    func save() {
        do {
            let data = try JSONEncoder().encode(path)
            try data.write(to: savePath)
        } catch {
            print("Failed to save navigation data")
        }
    }
}
 */


@Observable
class NavigationPathCodable{
    
    var path:NavigationPath{
        didSet{
            save()
        }
    }
    
    
    private let pathWaySave = URL.documentsDirectory.appending(path: "SavedPath")
    
    
    
    init(){
        if let data = try? Data(contentsOf: pathWaySave){
            if let decoded = try? JSONDecoder().decode(NavigationPath.CodableRepresentation.self, from: data){
                path =  NavigationPath(decoded)
                return
            }
        }
        
        path = NavigationPath()
    }
    
    
    func save(){
        guard let representation = path.codable else {return}
        
        do{
            let data = try JSONEncoder().encode(representation)
            try data.write(to: pathWaySave)
            
        }catch{
            fatalError("Error in 82 in PathStore.swift package")
        }
        
    }
    
    
}






/*
@Observable
class PathStore{
    
    var path:NavigationPath{
        didSet{
            save()
        }
    }
    
    
    let localPath = URL.documentsDirectory.appending(path: "SavedPath")
    
    init(){
        if let data = try? Data(contentsOf: localPath){
            if let decoded = try? JSONDecoder().decode(NavigationPath.CodableRepresentation.self, from: data){
                path = NavigationPath(decoded)
                return
            }
        }
        
        path = NavigationPath()
        
    }
    
    func save(){
        do{
            let data = try JSONEncoder().encode(path)
            try data.write(to: localPath)
            
        }catch{
            print("114.row in PathStore")
        }
    }
    
    
}
*/

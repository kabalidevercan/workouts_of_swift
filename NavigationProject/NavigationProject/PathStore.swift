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
class StorePath{
    var path:[Int]{
        didSet{
            save()
        }
    }
    
    private let savePath = URL.documentsDirectory.appending(path: "SavedPath")

    init() {
        if let data = try? Data(contentsOf: savePath){
            if let decoded = try? JSONDecoder().decode([Int].self, from: data){
                path = decoded
                return
            }
        }
        
        path = []
    }
    
    
    func save(){
        do{
            let data = try JSONEncoder().encode(path)
            try data.write(to: savePath )
        
            
            
        }catch{
            fatalError("Failed to save navigation Data")
        }
    }
    
}

@Observable
class NewPathWay{
    var path:[Int]{
        didSet{
            save()
        }
    }
    
    
    private let pathWay = URL.documentsDirectory.appending(path:"PathWay")
    
    
    init(){
        
        if let data = try? Data(contentsOf: pathWay){
            if let decodedPath = try? JSONDecoder().decode([Int].self, from: data){
                path = decodedPath
                return
            }
        }
        
        path = []
    }
    
    
    func save() {
        do{
            let data = try JSONEncoder().encode(path)
            try data.write(to: pathWay)
            
        }catch{
            fatalError("Error in 115.row PathStore")
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

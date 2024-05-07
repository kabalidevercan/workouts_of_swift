//
//  WebService.swift
//  mvvmtry
//
//  Created by Ercan Kabali on 7.05.2024.
//

import Foundation


final class WebService {
    
    static func getUserData() async throws -> [UserModel] {
        let urlString =  "https://api.github.com/users"
        
        
        guard let url = URL(string: urlString) else {
            throw ErrorCases.invalidURL
        }
        
        let (data,response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200 else {
            throw ErrorCases.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode([UserModel].self, from: data)
        }catch {
            throw ErrorCases.invalidData
        }
        
    }
 
    enum ErrorOlaylari : LocalizedError {
        case invalidURL
        case invalidResponse
        case invalidData
        
        var stringError : String? {
            switch self {
            case .invalidURL : "Error in URL"
            case .invalidResponse : "Error in Response"
            case .invalidData : "Error in Data"
            }
        }
    }
    
}



final class ServiceOfWeb {
    
    static func getUser() async throws -> [UserModel]{
        
        
        let urlString = "https://api.github.com/users"
        
        guard let url = URL(string: urlString) else {
            throw ErrorCases.invalidURL
        }
        
        
        let (data,response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200  else {
            throw ErrorCases.invalidResponse
        }
        
        do{
            let decoder = JSONDecoder()
            return try JSONDecoder().decode([UserModel].self, from: data)
        }catch {
            throw ErrorCases.invalidData
        }
        
    }
    
    
    enum ErrorCases : LocalizedError {
        case invalidURL
        case invalidResponse
        case invalidData
        
        var stringError: String? {
            switch self {
            case .invalidURL : "Invalid URL"
            case .invalidResponse  : "Invalid Response"
            case .invalidData : "Invalid Data"
            
            }
        }
    }
    
}

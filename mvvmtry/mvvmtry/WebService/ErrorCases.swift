//
//  ErrorCases.swift
//  mvvmtry
//
//  Created by Ercan Kabali on 7.05.2024.
//

import Foundation


enum ErrorCases : LocalizedError{
    case invalidURL
    case invalidResponse
    case invalidData
    
    var errorDescription: String? {
        switch self {
        case .invalidURL : return "Invalid URL found."
            
        case .invalidResponse : return "Invalid response found."
            
        case .invalidData : return "Invalid data found."
        }
    }
}




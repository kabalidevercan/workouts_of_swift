//
//  UserListViewModel.swift
//  mvvmtry
//
//  Created by Ercan Kabali on 7.05.2024.
//

import Foundation

@MainActor
final class UserListViewModel: ObservableObject {
    
    @Published var users : [UserModel]?
    @Published var isLoading  = false
    @Published var shouldShowError = false
    @Published var errorMessage : String?
    
    func getUsers() async {
        isLoading = true
        do {
            let users = try await WebService.getUserData()
            self.users = users
            self.isLoading = false
        }catch(let error){
            self.isLoading = false
            self.shouldShowError = true
            self.errorMessage = error.localizedDescription
        }
    }
}

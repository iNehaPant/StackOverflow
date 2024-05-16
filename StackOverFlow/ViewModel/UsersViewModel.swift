//
//  UsersViewModel.swift
//  StackOverFlow
//
//  Created by Neha Pant on 16/05/2024.
//

import Foundation

enum sortUsers: String {
    case reputation
}

@MainActor
class UsersViewModel: ObservableObject {
    @Published var users: [User] = [User]()
    @Published var isError: Bool = false
    @Published var isErrorMessage: String = ""
    fileprivate let networkManager: NetworkService
    
    init(networkManager: NetworkService) {
        self.networkManager = networkManager
    }
    
    func getUserData(with pageSize: Int, order: String, sort: String) {
        Task {
            do {
                let userData: UserData = try await networkManager.fetchUsers(with: pageSize, order: order, sort: sort)
                self.users = userData.user
                print(self.users)
            } catch {
                print(error)
                isError = true
                isErrorMessage = error.localizedDescription
            }
        }
    }
}

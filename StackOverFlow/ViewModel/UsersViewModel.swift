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

class UsersViewModel: ObservableObject {
    @Published var users: [User] = [User]()
    @Published var isError: Bool = false
    @Published var errorMessage: String = ""
    fileprivate let networkManager: NetworkService
    fileprivate let userDefault: UserDefaults
    
    init(networkManager: NetworkService, userDefault: UserDefaults) {
        self.networkManager = networkManager
        self.userDefault = userDefault
    }
    
    func getUserData(with pageSize: Int, order: String, sort: String) {
        Task {
            do {
                let userData: UserData = try await networkManager.fetchUsers(with: pageSize, order: order, sort: sort)
                DispatchQueue.main.async { [weak self] in
                    guard let weakSelf = self else {return}
                    weakSelf.users = userData.user
                    let storedData = weakSelf.userDefault.getStoredUsersData()
                    weakSelf.users.indices.forEach { index in
                        let idToUpdate = weakSelf.users[index].id
                        if let userStoredData = storedData?.first(where: { $0.id == idToUpdate }) {
                            weakSelf.users[index].isFollow = userStoredData.isFollow
                        }
                    }
                    weakSelf.userDefault.setStoredUsersData(from: weakSelf.users)
                }
            } catch {
                isError = true
                errorMessage = error.localizedDescription
            }
        }
    }
    
    func changeUserFollowStatus(from status: Bool, index: Int) {
        self.users[index].isFollow = status
        userDefault.setStoredUsersData(from: self.users)
    }
}

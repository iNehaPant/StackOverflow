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
    
    //get user list
    func getUserData(with pageSize: Int, order: String, sort: String) async {
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
            DispatchQueue.main.async { [weak self] in
                guard let weakSelf = self else {return}
                weakSelf.isError = true
                weakSelf.errorMessage = error.localizedDescription
            }
        }
    }
    
    //changing the user follow status
    //index: is the index number in the array where user clicked
    func changeUserFollowStatus(from status: Bool, index: Int) {
        DispatchQueue.main.async { [weak self] in
            guard let weakSelf = self else {return}
            weakSelf.users[index].isFollow = status
            weakSelf.userDefault.setStoredUsersData(from: weakSelf.users)
        }
    }
}

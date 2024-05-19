//
//  MockNetworkManager.swift
//  StackOverFlow
//
//  Created by Neha Pant on 19/05/2024.
//

import Foundation

struct MockNetworkManager: NetworkService {
    var mockUserData: UserData
    
    init(mockUserData: UserData = UserData(user: [User(id: 11683,
                                                       displayName: "Jon Skeet",
                                                       profileImage: "https://www.gravatar.com/avatar/6d8ebb117e8d83d74ea95fb",
                                                       reputation: 1454978)])) {
        self.mockUserData = mockUserData
    }
    
    func fetchUsers<T: Decodable>(
        with pageSize: Int,
        order: String,
        sort: String
    ) async throws -> T {
        return self.mockUserData as! T
    }
}

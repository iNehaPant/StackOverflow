//
//  MockUsers.swift
//  StackOverFlow
//
//  Created by Neha Pant on 18/05/2024.
//

import Foundation

struct MockUsers {
    static func getUsers() -> [User] {
        let user = User(id: 11683,
                        displayName: "Jon Skeet",
                        profileImage: "https://www.gravatar.com/avatar/6d8ebb117e8d83d74ea95fb",
                        reputation: 1454978)
        return [user]
    }
}

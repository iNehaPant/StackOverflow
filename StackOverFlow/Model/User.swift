//
//  User.swift
//  StackOverFlow
//
//  Created by Neha Pant on 16/05/2024.
//

import Foundation

struct User: Codable, Identifiable {
    let id: Int
    let displayName: String
    let profileImage: String
    let reputation: Int
    var isFollow: Bool?
    
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        displayName = try container.decode(String.self, forKey: .displayName)
        profileImage = try container.decode(String.self, forKey: .profileImage)
        reputation = try container.decode(Int.self, forKey: .reputation)
        isFollow = try? container.decode(Bool.self, forKey: .isFollow)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(displayName, forKey: .displayName)
        try container.encode(profileImage, forKey: .profileImage)
        try container.encode(reputation, forKey: .reputation)
        try container.encode(isFollow, forKey: .isFollow)
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "account_id"
        case displayName = "display_name"
        case profileImage = "profile_image"
        case reputation
        case isFollow
    }
}


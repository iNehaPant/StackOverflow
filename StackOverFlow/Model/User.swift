//
//  User.swift
//  StackOverFlow
//
//  Created by Neha Pant on 16/05/2024.
//

import Foundation

struct User: Decodable, Identifiable {
    let id: Int
    let displayName: String
    
    enum CodingKeys: String, CodingKey {
        case id = "account_id"
        case displayName = "display_name"
    }
}

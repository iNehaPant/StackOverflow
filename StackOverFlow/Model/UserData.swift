//
//  UserData.swift
//  StackOverFlow
//
//  Created by Neha Pant on 16/05/2024.
//

import Foundation

struct UserData: Decodable {
    let user: [User]
    
    enum CodingKeys: String, CodingKey {
        case user = "items"
    }
}

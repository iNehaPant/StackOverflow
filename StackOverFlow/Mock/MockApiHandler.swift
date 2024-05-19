//
//  MockApiHandler.swift
//  StackOverFlow
//
//  Created by Neha Pant on 18/05/2024.
//

import Foundation

struct MockApiHandler: APIHandling {
    func getData(
        from urlString: String,
        session: URLSession,
        pageSize: Int,
        order: String,
        sort: String
    ) async throws -> (Data, URLResponse) {
        let jsonData = MockUserJson.mockUsers.data(using: .utf8)!
        return (jsonData, HTTPURLResponse())
    }
}

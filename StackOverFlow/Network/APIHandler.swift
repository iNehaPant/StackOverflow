//
//  APIHandler.swift
//  StackOverFlow
//
//  Created by Neha Pant on 16/05/2024.
//

import Foundation

protocol APIHandling {
    func getData(
        from urlString: String,
        session: URLSession,
        pageSize: Int,
        order: String,
        sort: String
    ) async throws -> (Data, URLResponse)
}

struct APIHandler: APIHandling {
    private let site: String = "stackoverflow"
    
    func getData(
        from urlString: String,
        session: URLSession,
        pageSize: Int,
        order: String,
        sort: String
    ) async throws -> (Data, URLResponse) {
        var components = URLComponents(string: urlString)
        components?.queryItems = [
            URLQueryItem(name: "pagesize", value: String(pageSize)),
            URLQueryItem(name: "order", value: order),
            URLQueryItem(name: "sort", value: sort),
            URLQueryItem(name: "site", value: site)
        ]
        
        guard let url = components?.url else {
            throw NetworkError.invalidURL
        }
        
        return try await session.data(from: url)
    }
}

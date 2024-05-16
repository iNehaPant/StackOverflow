//
//  NetworkManager.swift
//  StackOverFlow
//
//  Created by Neha Pant on 16/05/2024.
//

import Foundation

protocol NetworkService {
    func fetchUsers<T: Decodable>(
        with pageSize: Int,
        order: String,
        sort: String
    ) async throws -> T
}

struct NetworkManager: NetworkService {
    fileprivate let baseUrl: String
    fileprivate let session: URLSession
    fileprivate let apiHandler: APIHandler
    fileprivate let parserHandler: ParserHandler
    
    init(baseUrl: String,
         session: URLSession,
         apiHandler: APIHandler,
         parserHandler: ParserHandler) {
        self.baseUrl = baseUrl
        self.session = session
        self.apiHandler = apiHandler
        self.parserHandler = parserHandler
    }
    
    func fetchUsers<T: Decodable>(
        with pageSize: Int,
        order: String,
        sort: String
    ) async throws -> T {
        let (data,_) =  try await apiHandler.getData(
            from: baseUrl,
            session: session,
            pageSize: pageSize,
            order: order,
            sort: sort
        )
        return try parserHandler.parseData(data: data)
    }
}


enum NetworkError: Error {
    case invalidURL
}

//
//  ParserHandler.swift
//  StackOverFlow
//
//  Created by Neha Pant on 16/05/2024.
//

import Foundation

protocol Parsing {
    func parseData<T: Decodable>(data: Data) throws -> T
}

struct ParserHandler: Parsing {
    func parseData<T: Decodable>(data: Data) throws -> T {
        return try JSONDecoder().decode(T.self, from: data)
    }
}

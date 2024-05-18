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
//        if let string = String(data: data, encoding: .utf8) {
//            print("Converted string: \(string)")
//        } else {
//            print("Failed to convert Data to String")
//        }
        return try JSONDecoder().decode(T.self, from: data)
    }
}

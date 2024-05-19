//
//  MockParserHandler.swift
//  StackOverFlow
//
//  Created by Neha Pant on 18/05/2024.
//

import Foundation

struct MockParseHandler: Parsing {
    func parseData<T>(data: Data) throws -> T where T : Decodable {
        return try JSONDecoder().decode(T.self, from: data)
    }
}

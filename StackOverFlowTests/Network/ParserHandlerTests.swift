//
//  ParserHandlerTests.swift
//  StackOverFlowTests
//
//  Created by Neha Pant on 18/05/2024.
//

import XCTest
@testable import StackOverFlow

final class ParserHandlerTests: XCTestCase {
    var sut: ParserHandler!
    
    override func setUp() {
        super.setUp()
        sut = ParserHandler()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testParseData() {
        //given
        let data = MockUserJson.mockUsers.data(using: .utf8)!
        //when
        do {
            let userData: UserData = try sut.parseData(data: data)
            //then
            XCTAssertEqual(userData.user, MockUsers.getUsers())
        } catch {
            
        }
    }
}

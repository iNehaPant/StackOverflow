//
//  NetworkManagerTests.swift
//  StackOverFlowTests
//
//  Created by Neha Pant on 18/05/2024.
//

import XCTest
@testable import StackOverFlow

final class NetworkManagerTests: XCTestCase {
    var sut: NetworkManager!
    
    override func setUp()  {
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: config)
        let mockApiHandler = MockApiHandler()
        let mockParseHandler = MockParseHandler()
        
        sut = NetworkManager(
            baseUrl: Configuration.baseUrl,
            session: urlSession,
            apiHandler: mockApiHandler,
            parserHandler: mockParseHandler
        )
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func testFetchUsers() async {
        //given
         let mockUsers = MockUsers.getUsers()
        //when
        do {
            let data: UserData = try await sut.fetchUsers(with: 20, order: "desc", sort: "reputation")
            //then
            XCTAssertEqual(data.user, mockUsers)
        }catch {
            XCTFail("Error: \(error)")
        }
    }

}

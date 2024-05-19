//
//  APIHandlerTests.swift
//  StackOverFlowTests
//
//  Created by Neha Pant on 18/05/2024.
//

import XCTest
@testable import StackOverFlow

final class APIHandlerTests: XCTestCase {
    
    var sut: APIHandler!
    
    override func setUp() {
        super.setUp()
        sut = APIHandler()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testGetData() async {
        //given
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: config)
        setUserMockProtocolSuccess()
        
        //when
        do {
            let (_, response) = try await sut.getData(
                from: Configuration.baseUrl,
                session: urlSession,
                pageSize: 20,
                order: "desc",
                sort: "reputation"
            )
            //then
            // Then
            XCTAssertTrue(response is HTTPURLResponse)
            XCTAssertEqual((response as? HTTPURLResponse)?.statusCode, 200)
        } catch {
            XCTFail("Error: \(error)")
        }
        
    }
    
    func setUserMockProtocolSuccess() {
        MockURLProtocol.requestHandler = { request in
            let usersData = MockUserJson.mockUsers.data(using: .utf8)!
            let response = HTTPURLResponse.init(url: request.url!, statusCode: 200, httpVersion: "2.0", headerFields: nil)!
            return (response, usersData)
        }
    }
    
}

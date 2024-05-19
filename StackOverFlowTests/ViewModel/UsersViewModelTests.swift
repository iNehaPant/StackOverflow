//
//  UsersViewModelTests.swift
//  StackOverFlowTests
//
//  Created by Neha Pant on 18/05/2024.
//

import XCTest
@testable import StackOverFlow



final class UsersViewModelTests: XCTestCase {
    var sut: UsersViewModel!
    
    override func setUp()  {
        super.setUp()
        sut = UsersViewModel(networkManager: MockNetworkManager(), userDefault: UserDefaults())
    }
   
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    @MainActor
    func testGetUserData() async {
        //given
        let mockData = MockUsers.getUsers()
        //when
         await sut.getUserData(with: 20, order: "desc", sort: "reputation")
        //then
        XCTAssertEqual(mockData, sut.users)
    }
}

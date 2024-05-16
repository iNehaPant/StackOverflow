//
//  StackOverFlowApp.swift
//  StackOverFlow
//
//  Created by Neha Pant on 16/05/2024.
//

import SwiftUI

@main
struct StackOverFlowApp: App {
    var body: some Scene {
        WindowGroup {
            UsersList(
                usersViewModel: UsersViewModel(
                    networkManager: NetworkManager(
                        baseUrl: Configuration.baseUrl,
                        session: URLSession.shared,
                        apiHandler: APIHandler(),
                        parserHandler: ParserHandler()
                    )
                )
            )
        }
    }
}

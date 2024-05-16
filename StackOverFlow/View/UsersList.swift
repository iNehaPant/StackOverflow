//
//  UsersList.swift
//  StackOverFlow
//
//  Created by Neha Pant on 16/05/2024.
//

import SwiftUI

struct UsersList: View {
    @StateObject var usersViewModel: UsersViewModel
    
    var body: some View {
        List(usersViewModel.users) {user in
            Text(user.displayName)
        }
        .onAppear {
            usersViewModel.getUserData(with: 20, order: "desc", sort: sortUsers.reputation.rawValue)
        }
    }
}

#Preview {
    UsersList(usersViewModel: UsersViewModel(networkManager: NetworkManager(baseUrl: "", session: URLSession.shared, apiHandler: APIHandler(), parserHandler: ParserHandler())))
}

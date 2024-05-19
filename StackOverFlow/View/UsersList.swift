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
        ScrollView {
            LazyVStack {
                ForEach(usersViewModel.users.indices, id: \.self) { index in
                    let user = usersViewModel.users[index]
                    HStack(spacing: 20) {
                        AsyncImage(url: URL(string:  user.profileImage)) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 60, height: 60)
                        } placeholder: {
                            // Default Image
                            Image(systemName: "photo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 60, height: 60)
                                .foregroundColor(.gray)
                        }
                        
                        VStack(alignment: .leading) {
                            Text(user.displayName)
                                .font(Font.custom("Arial", size: 14).weight(.bold))
                            Text("\(user.reputation)")
                                .font(Font.custom("Arial", size: 14))
                            
                            //Follow and Unfollow functionality
                            HStack {
                                Button(action: {
                                    usersViewModel.changeUserFollowStatus(from: !(user.isFollow ?? false), index: index)
                                }, label: {
                                    Text("Follow")
                                        .padding(5)
                                        .foregroundColor(user.isFollow ?? false ? .blue : .gray)
                                })
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(user.isFollow ?? false ? .blue : .gray, lineWidth: 2)
                                )
                                .cornerRadius(10)
                                
                                
                                Button(action: {
                                    usersViewModel.changeUserFollowStatus(from: false, index: index)
                                }, label: {
                                    Text("UnFollow")
                                        .padding(5)
                                        .foregroundColor(.white)
                                        .background(.blue)
                                })
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.blue, lineWidth: 2)
                                )
                                .cornerRadius(10)
                                .opacity(user.isFollow ?? false ? 1.0 : 0.0)
                                .disabled(!(user.isFollow ?? false))
                            }
                        }
                        Spacer()
                    }
                    .padding(20)
                    
                }
            }
        }
        .refreshable {
            getUserData()
        }
        .alert(usersViewModel.errorMessage,
               isPresented: $usersViewModel.isError,
               actions: {
            Button("Ok", role: .cancel){}
        })
        .onAppear {
            getUserData()
        }
    }
    
    func getUserData() {
        Task {
            await usersViewModel.getUserData(
                with: 20,
                order: "desc",
                sort: sortUsers.reputation.rawValue
            )
        }
    }
}

#Preview {
    UsersList(usersViewModel: UsersViewModel(networkManager: MockNetworkManager(), userDefault: UserDefaults()))
}

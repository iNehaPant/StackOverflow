# StackOverflow
StackOverFlow Users

**Overview**

**TaskDescription and my Thinking behind it:**
- I have used MMVM architecture pattern for the app. To fetch the data I have used  **async await** 
- **async await** provide quite clean and easy way to get the data.
- I have shown all the data and its respective error in the SwiftUI
- I have added refresh feature, if there an error occur, user can fetch the data by pull to refresh

**StackOverflow**
StackOverflow is an iOS app that fetches a list of users from a given URL

**Requirements**
Support for handling errors gracefully
Features
Fetches list of users and parses the list
Displays the user name, profile image, repuation and Follow and unfollow features.
Supports iOS 15 and above.

**UsersListViewModel**
The UsersListViewModel class is responsible for fetching and managing the list of users 

**Functions**
- getUserData(): Fetches and parses the list of users from the given URL.
- changeUserFollowStatus : changing the user follow status

**Error Handling**
 Handles errors gracefully by displaying error messages when fetching users fails.


**Features**
**MVVM Architecture**: The project is structured using the Model-View-ViewModel (MVVM) architectural pattern for clear separation of concerns.

**Async await** :
It is being used for async programming


**SwiftUI Framework:** 

**Dependency Injection:** The project embraces Dependency Injection, ensuring a flexible and maintainable codebase.

**SOLID Principles:** The code adheres to SOLID principles, promoting scalability, flexibility, and maintainability.

**Unit Testing:** Comprehensive unit testing is in place to ensure the reliability and correctness of the codebase.

**Project Structure**
StackOverFlow.swift

**UsersListViewModel**
UsersListViewModel, UsersList interacts with UsersListViewModel to manage and display of data.
- Error Handling

**Dependency Injection**
URL and session dependencies are injected from StackOverFlowApp, where the application is loaded.

** Generic:**
Network classes uses Generic 


**Mocking**
Mock responses and mocking of URLSession and URLProtocol are implemented under the Mock folder.


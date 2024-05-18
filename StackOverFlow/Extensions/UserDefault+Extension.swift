//
//  UserDefault+Extension.swift
//
//

import Foundation

protocol UserDefaultItems {
    func getStoredUsersData() -> [User]?
    func setStoredUsersData(from user: [User]?)
}

extension UserDefaults: UserDefaultItems {
    func getStoredUsersData() -> [User]? {
        if let data = UserDefaults.standard.data(forKey: "store_data") {
            do {
                let items = try JSONDecoder().decode([User].self, from: data)
                return items
            } catch {
                return nil
            }
        } else {
            return nil
        }
    }
    
    func setStoredUsersData(from user: [User]?) {
        do {
            if user != nil {
                let data = try JSONEncoder().encode(user)
                UserDefaults.standard.set(data, forKey: "store_data")
            } else {
                UserDefaults.standard.removeObject(forKey: "store_data")
            }
        } catch {
            print("Error encoding data: \(error)")
        }
    }
}

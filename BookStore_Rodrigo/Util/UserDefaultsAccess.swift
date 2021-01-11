//
//  UserDefaultsAccess.swift
//  BookStore_Rodrigo
//
//  Created by Rodrigo Giglio on 10/01/21.
//

import Foundation

class UserDefaultsAccess {
    
    // MARK: - Constants
    private static let userDefaults = UserDefaults.standard
    private static let favoriteBooksKey = "favorite_books"

    
    // MARK: - Save Methods
    public static func saveFavoriteBook(withID id: String) {
        
        var favorites = UserDefaultsAccess.getFavoriteBookIds()
        favorites.insert(id)
        
        userDefaults.set(Array(favorites), forKey: favoriteBooksKey)
    }
    
    // MARK: - Get Methods
    public static func getFavoriteBookIds() -> Set<String> {
        let favoritesArray = userDefaults.object(forKey: favoriteBooksKey) as? [String] ?? [String]()
        return Set(favoritesArray.map({ $0 }))
    }

    // MARK: - Delete Methods
    public static func deleteFavoriteBook(withID id: String) {
        
        var favorites = UserDefaultsAccess.getFavoriteBookIds()
        favorites.remove(id)
        
        userDefaults.set(Array(favorites), forKey: favoriteBooksKey)
    }
}

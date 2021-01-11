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
    public static func saveFavoriteBook(_ book: Book) {
        
        var favorites = UserDefaultsAccess.getFavoriteBooks()
        favorites.append(book)
        
        userDefaults.set(try? PropertyListEncoder().encode(favorites), forKey: favoriteBooksKey)
    }
    
    // MARK: - Get Methods
    public static func getFavoriteBooks() -> [Book] {
        
        if let data = UserDefaults.standard.value(forKey: favoriteBooksKey) as? Data {
            let favorites = try? PropertyListDecoder().decode(Array<Book>.self, from: data)
            return favorites ?? []
        } else {
            return []
        }
    }

    // MARK: - Delete Methods
    public static func deleteFavoriteBook(withID id: String) {
        
        var favorites = UserDefaultsAccess.getFavoriteBooks()
        favorites = favorites.filter({ $0.id != id })
        
        userDefaults.set(try? PropertyListEncoder().encode(favorites), forKey: favoriteBooksKey)
    }
}

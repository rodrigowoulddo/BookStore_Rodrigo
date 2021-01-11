//
//  FavoriteBooksList.swift
//  BookStore_Rodrigo
//
//  Created by Rodrigo Giglio on 11/01/21.
//

import Foundation

protocol FavoriteBooksListViewModelDelegate: class {
    func didLoadBooks()
}

class FavoriteBooksListViewModel {
    
    // MARK: - Attributes
    weak var delegate: FavoriteBooksListViewModelDelegate?
    let service = Service<BookEndpoints>()
    
    // MARK: - Computed Variables
    var favoriteBooks: [Book] = []
    var selectedBook: Book? = nil
    
    // MARK: - Public Methods
    public func fetchBooks() {
        favoriteBooks = UserDefaultsAccess.getFavoriteBooks()
        delegate?.didLoadBooks()
    }
    
    public func getBook(for indexPath: IndexPath) -> Book {
        return favoriteBooks[indexPath.row]
    }
    
    public func selectBook(at indexPath: IndexPath) {
        self.selectedBook = getBook(for: indexPath)
    }
}

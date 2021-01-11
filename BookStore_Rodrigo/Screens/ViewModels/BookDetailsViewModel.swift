//
//  BookDetailsViewModel.swift
//  BookStore_Rodrigo
//
//  Created by Rodrigo Giglio on 10/01/21.
//

import Foundation

protocol BookDetailsViewModelDelegate: class {
    
    func didHandleFavorite()
}

class BookDetailsViewModel {
    
    // MARK: - Attributes
    weak var delegate: BookDetailsViewModelDelegate?
    var book: Book
    
    // MARK: - Init
    init(book: Book) {
        self.book = book
    }
    
    // MARK: - Computed Variables
    var formattedAuthors: String? {
        return book.volumeInfo.authors?.joined(separator: "; ")
    }
    
    var isBookFavorite: Bool {
        return UserDefaultsAccess.getFavoriteBookIds().contains(book.id)
    }
    
    var buyButtonText: String {
        if let listPrice = book.saleInfo.listPrice {
            return "\(listPrice.currencyCode) \(listPrice.amount)"
        } else {
            return "Out of stock"
        }
    }
    
    var buyingEnabled: Bool {
        return book.saleInfo.buyLink != nil
    }
    
    // MARK: - Public Functions
    func handleFavoriteAction() {
        
        isBookFavorite ?
            UserDefaultsAccess.deleteFavoriteBook(withID: book.id) :
            UserDefaultsAccess.saveFavoriteBook(withID: book.id)
        
        delegate?.didHandleFavorite()
    }
}

//
//  BookDetailsViewModel.swift
//  BookStore_Rodrigo
//
//  Created by Rodrigo Giglio on 10/01/21.
//

import Foundation

protocol BookDetailsViewModelDelegate: class {
    
    /// Define interections here
    
}

class BookDetailsViewModel {
    
    // MARK: - Attributes
    weak var delegate: BookDetailsViewModelDelegate?
    var book: Book
    
    // MARK: - Computed Variables
    var formattedAuthors: String? {
        return book.volumeInfo.authors?.joined(separator: "; ")
    }
    
    // MARK: - Init
    init(book: Book) {
        self.book = book
    }
}

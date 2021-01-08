//
//  BookListViewModel.swift
//  BookStore_Rodrigo
//
//  Created by Rodrigo Giglio on 08/01/21.
//

import Foundation

protocol BookListViewModelDelegate: class {
    func didLoadBooks()
    func didFetchError()
}

class BookListViewModel {
    
    // MARK: - Attributes
    weak var delegate: BookListViewModelDelegate?
    let service = Service<BookEndpoints>()
    
    var allBooks: [Book] = []
    var currentPage = 0
    
    // MARK: - Public Methods
    public func fetchBooks() {
        
        service.request(.getVolumes(page: currentPage)){
            (result: Result<BookResponse,Error>) in
            
            switch result {
            
            case .success(let response):
                
                if let items = response.items {
                    self.updateBookList(byAdding: items)
                }
                
                /// If there are no items, it means
                /// all books have already been loaded
                
            case .failure(let error):
                print(error)
                self.delegate?.didFetchError()
            }
        }
    }
    
    public func getBook(for indexPath: IndexPath) -> Book {
        return allBooks[indexPath.row]
    }
    
    public func shouldLoadNextPage(whenDisplaying indexPath: IndexPath) -> Bool {
        
        /// Once we load the last books from
        /// the array, we fetch the next page.
        
        /// We start loading the next page when
        /// the eighest last book is displayed, so
        /// the user doesnt notice the loading.
        
        return indexPath.row == allBooks.count - 8
    }
    
    // MARK: - Private Methods
    private func updateBookList(byAdding books: [Book]) {
        
        allBooks.append(contentsOf: books)
        raiseBooksRequestPage()
        delegate?.didLoadBooks()
    }
    
    private func raiseBooksRequestPage() {
        currentPage += 1
    }
}

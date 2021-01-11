//
//  FsvoriteBooksListViewController.swift
//  BookStore_Rodrigo
//
//  Created by Rodrigo Giglio on 11/01/21.
//

import UIKit

class FavoriteBooksListViewController: UICollectionViewController {
    
    // MARK: - Constants
    private let bookDetailsSegueIdentifier = "BookDetails"
    private let bookCellIdentifier = "BookCell"
    private let sectionInsets = UIEdgeInsets(top: 50, left: 10, bottom: 40, right: 10)
    private let itemsPerRow: CGFloat = 2
    
    // MARK: - Atributes
    var viewModel = FavoriteBooksListViewModel()
 
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        viewModel.fetchBooks()
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == bookDetailsSegueIdentifier {
            
            guard
                let bookDetailVC = segue.destination as? BookDetailsViewController,
                let selectedBook = viewModel.selectedBook
            else { return }
            
            bookDetailVC.viewModel = BookDetailsViewModel(book: selectedBook)
        }
    }
}
// MARK: - BookListViewModelDelegate
extension FavoriteBooksListViewController: FavoriteBooksListViewModelDelegate {
    
    func didLoadBooks() {
        collectionView.reloadData()
    }
}

// MARK: - UICollectionViewDataSource
extension FavoriteBooksListViewController {
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.favoriteBooks.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                
        let book = viewModel.getBook(for: indexPath)
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: bookCellIdentifier, for: indexPath) as? BookCollectionViewCell {
            
            cell.configure(with: book)
            return cell
            
        } else {
            return UICollectionViewCell()
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        viewModel.selectBook(at: indexPath)
        performSegue(withIdentifier: bookDetailsSegueIdentifier, sender: nil)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension FavoriteBooksListViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        /// Setting the size like this, force the collection view
        /// to always display 2 cells at each row.
        
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: 250)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
}

//
//  BookCollectionViewCell.swift
//  BookStore_Rodrigo
//
//  Created by Rodrigo Giglio on 08/01/21.
//

import UIKit

class BookCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var publishDateLabel: UILabel!
    
   // MARK: - Public Methods
    public func configure(with book: Book) {
        
        /// A reset is needed, once the book
        /// might have some nil values
        reset()
        
        /// We load the cover using KingFisher Pod.
        /// The call is assyncronous and has an in-built cache.
        if let imageURL = book.volumeInfo.imageLinks?.thumbnail {
            coverImageView.setImage(from: imageURL)
        }
        
        titleLabel.text = book.volumeInfo.title
        authorLabel.text = book.volumeInfo.authors?.joined(separator: "; ")
        publishDateLabel.text = book.volumeInfo.publishedDate
    }
    
    // MARK: - Private Methods
    private func reset() {
        
        coverImageView.image = nil
        titleLabel.text = nil
        authorLabel.text = nil
        publishDateLabel.text = nil
    }
}

//
//  BookDetailsViewController.swift
//  BookStore_Rodrigo
//
//  Created by Rodrigo Giglio on 10/01/21.
//

import UIKit

class BookDetailsViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var publishedDateLabel: UILabel!
    @IBOutlet weak var previewButton: UIButton!
    @IBOutlet weak var buyButton: UIButton!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    // MARK: - Atributes
    var viewModel: BookDetailsViewModel!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        view.layoutIfNeeded()
    }
    
    // MARK: - Private Methods
    private func configure() {
        
        configureCoverImage()
        configureBasicInformation()
        configurePreview()
        configureBuying()
        configureDescription()
    }
    
    private func configureCoverImage() {
        
        if let imageURL = viewModel.book.volumeInfo.imageLinks?.thumbnail {
            
            coverImageView.setImage(from: imageURL)
        }
    }
    
    private func configureBasicInformation() {
        titleLabel.text = viewModel.book.volumeInfo.title
        authorLabel.text = viewModel.formattedAuthors
        publishedDateLabel.text = viewModel.book.volumeInfo.publishedDate
    }
    
    private func configurePreview() {
        
    }
    
    private func configureBuying() {
        
    }
    
    private func configureDescription() {
        descriptionTextView.text = viewModel.book.volumeInfo.description
    }
}

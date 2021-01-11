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
    @IBOutlet weak var favoriteBarButtonItem: UIBarButtonItem!
    
    // MARK: - Atributes
    var viewModel: BookDetailsViewModel!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        configure()
    }
    
    // MARK: - Outlet Functions
    @IBAction func favoriteButtonAction(_ sender: Any) {
        viewModel.handleFavoriteAction()
    }
    
    @IBAction func previewButtonAction(_ sender: Any) {
        if let url = URL(string: viewModel.book.volumeInfo.previewLink) {
            UIApplication.shared.open(url)
        }
    }
    
    @IBAction func buyButtonAction(_ sender: Any) {
        
        if let buyURL = viewModel.book.saleInfo.buyLink,
           let url = URL(string: buyURL) {
            UIApplication.shared.open(url)
        }
    }
    
    // MARK: - Private Methods
    private func configure() {
        
        configureCoverImage()
        configureBasicInformation()
        configureBuying()
        configureDescription()
        configureFavorite()
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
    
    private func configureBuying() {
        buyButton.backgroundColor = viewModel.buyingEnabled ? .systemGreen : .systemGray
        buyButton.isEnabled = viewModel.buyingEnabled
        buyButton.setTitle(viewModel.buyButtonText, for: .normal)
    }
    
    private func configureDescription() {
        descriptionTextView.text = viewModel.book.volumeInfo.description
    }
    
    private func configureFavorite() {
        favoriteBarButtonItem.image = viewModel.isBookFavorite ? UIImage(systemName: "star.fill") : UIImage(systemName: "star")
    }
}

extension BookDetailsViewController: BookDetailsViewModelDelegate {
    func didHandleFavorite() {
        configureFavorite()
    }
}

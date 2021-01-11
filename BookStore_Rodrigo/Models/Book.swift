//
//  Book.swift
//  BookStore_Rodrigo
//
//  Created by Rodrigo Giglio on 08/01/21.
//

import Foundation

struct Book: Codable {
    
    let id: String
    let volumeInfo: VolumeInfo
    let saleInfo: SaleInfo
    
}

struct VolumeInfo: Codable {
    
    let title: String
    let authors: [String]?
    let publisher: String?
    let publishedDate: String?
    let description: String?
    let previewLink: String
    let imageLinks: ImageLinks?
    
}

struct SaleInfo: Codable {
    
    let listPrice: ListPrice?
    let buyLink: String?
    
}

struct ListPrice: Codable {
    
    let amount: Double
    let currencyCode: String
    
}

struct ImageLinks: Codable {
    let smallThumbnail: String
    let thumbnail: String
}

//
//  Book.swift
//  BookStore_Rodrigo
//
//  Created by Rodrigo Giglio on 08/01/21.
//

import Foundation

struct Book: Decodable {
    
    let id: String
    let volumeInfo: VolumeInfo
    let saleInfo: SaleInfo
    
}

struct VolumeInfo: Decodable {
    
    let title: String
    let authors: [String]?
    let publisher: String?
    let publishedDate: String?
    let description: String?
    let previewLink: String
    let imageLinks: ImageLinks?
    
}

struct SaleInfo: Decodable {
    
    let listPrice: ListPrice?
    let buyLink: String?
    
}

struct ListPrice: Decodable {
    
    let amount: Double
    let currencyCode: String
    
}

struct ImageLinks: Decodable {
    let smallThumbnail: String
    let thumbnail: String
}

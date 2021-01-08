//
//  BookModels.swift
//  BookStore_Rodrigo
//
//  Created by Rodrigo Giglio on 08/01/21.
//

import Foundation

struct BookResponse: Decodable {
    
    let totalItems: Int
    let items: [Book]?
}

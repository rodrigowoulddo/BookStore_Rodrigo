//
//  UICollectionView+Extensions.swift
//  BookStore_Rodrigo
//
//  Created by Rodrigo Giglio on 10/01/21.
//

import Foundation
import UIKit

extension UICollectionViewCell {
    
    
    @IBInspectable
    var hasShadow: Bool {
        
        get {
            return layer.shadowRadius > 0
        }
        
        set {
            if(newValue) {
                layer.shadowColor = UIColor.lightGray.cgColor
                layer.shadowOffset = CGSize(width: 0, height: 2.0)
                layer.shadowRadius = 2.0
                layer.shadowOpacity = 1.0
                layer.masksToBounds = false
                layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: contentView.layer.cornerRadius).cgPath
                layer.backgroundColor = UIColor.clear.cgColor

                contentView.layer.masksToBounds = true
                layer.cornerRadius = 10
            }
        }
        
    }
    
}

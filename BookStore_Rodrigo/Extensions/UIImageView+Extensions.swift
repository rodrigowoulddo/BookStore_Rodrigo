//
//  UIImageView+Extensions.swift
//  BookStore_Rodrigo
//
//  Created by Rodrigo Giglio on 08/01/21.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    
    static var placeholder: UIImage? {
        return UIImage(color: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
    }
    
    func setImage(
        from urlString: String,
        placeholder: UIImage? = UIImageView.placeholder,
        withActivityIndicator: Bool = false,
        withFade: Bool = true,
        fadeDuration: FadeDuration = .Normal ) {
        
        
        let url = URL(string: urlString)
        self.kf.indicatorType = withActivityIndicator ? .activity : .none
        self.kf.setImage(with: url, placeholder: placeholder, options: [.transition(.fade(fadeDuration.time))])
    }
    
    enum FadeDuration {
        
        case None
        case Fast
        case Normal
        case Slow
        
        var time: Double {
            switch self {
            case .None: return 0
            case .Fast: return 0.1
            case .Normal: return 0.2
            case .Slow: return 0.8
            }
        }
    }
}

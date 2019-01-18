//
//  UILabel+Init.swift
//  SliceControl
//
//  Created by Pedro Carrasco on 17/01/2019.
//  Copyright © 2019 Pedro Carrasco. All rights reserved.
//

import UIKit

// MARK: - Init
extension UILabel {
    
    convenience init(with text: String, textColor: UIColor, font: UIFont?) {
        self.init()
        self.text = text
        self.textColor = textColor
        self.textAlignment = .center
        self.adjustsFontSizeToFitWidth = true
        if let font = font { self.font = font }
    }
}

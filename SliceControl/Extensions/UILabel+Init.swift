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
    
    convenience init(with text: String) {
        self.init()
        self.text = text
    }
}

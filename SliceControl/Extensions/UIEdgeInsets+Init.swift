//
//  UIEdgeInsets+Init.swift
//  SliceControl
//
//  Created by Pedro Carrasco on 18/01/2019.
//  Copyright © 2019 Pedro Carrasco. All rights reserved.
//

import UIKit

// MARK: - Init
extension UIEdgeInsets {
    
    init(with padding: CGFloat) {
        self.init(top: padding, left: padding, bottom: padding, right: padding)
    }
}

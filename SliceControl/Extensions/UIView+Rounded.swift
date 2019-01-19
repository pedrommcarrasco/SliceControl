//
//  UIView+Rounded.swift
//  SliceControl
//
//  Created by Pedro Carrasco on 18/01/2019.
//  Copyright © 2019 Pedro Carrasco. All rights reserved.
//

import UIKit

// MARK: - Rounded
extension UIView {
    
    func withRoundedCorners() {
        layer.cornerRadius = bounds.height / 2
        layer.masksToBounds = true
    }
}

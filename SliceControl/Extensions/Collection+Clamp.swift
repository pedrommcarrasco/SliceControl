//
//  Collection+Clamp.swift
//  SliceControl
//
//  Created by Pedro Carrasco on 18/01/2019.
//  Copyright © 2019 Pedro Carrasco. All rights reserved.
//

import Foundation

// MARK: - Clamp
extension Collection where Index == Int {
    
    func element(forClamped index: Index) -> Element {
        return self[Swift.min(Swift.max(index, 0), count - 1)]
    }
}

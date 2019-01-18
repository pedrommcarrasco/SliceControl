//
//  NSObject+Create.swift
//  SliceControl
//
//  Created by Pedro Carrasco on 17/01/2019.
//  Copyright © 2019 Pedro Carrasco. All rights reserved.
//

import Foundation

// MARK: - Create
extension NSObject {
    
    static func create<T>(_ setup: ((T) -> Void)) -> T where T: NSObject {
        
        let obj = T()
        setup(obj)
        return obj
    }
}

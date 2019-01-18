//
//  SliceControlDelegate.swift
//  SliceControl
//
//  Created by Pedro Carrasco on 17/01/2019.
//  Copyright © 2019 Pedro Carrasco. All rights reserved.
//

import UIKit

// MARK: - SliceControlDelegate
public protocol SliceControlDelegate: class {
    func sliceControl(_ sliceControl: SliceControl, didSelectItemAt index: Int)
}

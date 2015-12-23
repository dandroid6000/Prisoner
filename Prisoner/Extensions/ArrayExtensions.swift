//
//  ArrayExtensions.swift
//  Prisoner
//
//  Created by Ben Dolmar on 12/23/15.
//  Copyright © 2015 Ben Dolmar. All rights reserved.
//

import Foundation

extension Array {
    subscript (safe index: Int) -> Element? {
        return indices ~= index ? self[index] : nil
    }
}
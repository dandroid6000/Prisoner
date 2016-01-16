//
//  StringExtensions.swift
//  Prisoner
//
//  Created by Dan Kane on 1/13/16.
//  Copyright © 2016 Ben Dolmar. All rights reserved.
//

import Foundation

extension String {
    func caseInsensitiveEquals(aString: String) -> Bool {
        return self.compare(aString, options: .CaseInsensitiveSearch) == .OrderedSame
    }
}

func ==(lhs: String, rhs: CustomStringConvertible) -> Bool {
    return lhs == rhs.description
}

func ==(lhs: CustomStringConvertible, rhs: String) -> Bool {
    return lhs.description == rhs
}

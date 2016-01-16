//
//  PrisonerConcienceOptions.swift
//  Prisoner
//
//  Created by Ben Dolmar on 12/23/15.
//  Copyright © 2015 Ben Dolmar. All rights reserved.
//

import Foundation

enum PrisonerConcienceOption: String {
    case Confess = "confess"
    case Silent = "silent"
}

extension PrisonerConcienceOption: CustomStringConvertible {
    var description: String {
        return self.rawValue
    }
}

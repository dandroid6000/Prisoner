//
//  PrisonerConcience.swift
//  Prisoner
//
//  Created by Ben Dolmar on 12/23/15.
//  Copyright © 2015 Ben Dolmar. All rights reserved.
//

import Foundation

class PrisonerConcience {
    let interrogation:Interrogation
    
    init(interrogation: Interrogation) {
        self.interrogation = interrogation
    }
    
    func decide() -> PrisonerConcienceOption {
        return .Confess
    }
}
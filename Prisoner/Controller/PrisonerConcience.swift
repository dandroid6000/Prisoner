//
//  PrisonerConcience.swift
//  Prisoner
//
//  Created by Ben Dolmar on 12/23/15.
//  Copyright © 2015 Ben Dolmar. All rights reserved.
//

import Foundation

class PrisonerConcience {
    let autoConfessNames = ["Ben", "Dolmar", "Ben Dolmar", "bdolmar"]
    
    let interrogation:Interrogation
    
    let rate = 0.3
    
    let memory = PrisonerMemory.sharedInstance
    
    init(interrogation: Interrogation) {
        self.interrogation = interrogation
    }
    
    // confess = 2 years if opponent confesses, 0 years otherwise
    // silent = 3 years if opponent is confesses, 1 year otherwise
    func decide() -> PrisonerConcienceOption {
        if autoConfessNames.contains({ $0.caseInsensitiveEquals(self.interrogation.partnerName) }) {
            // print("Auto-confess")
            return .Confess
        }
        
        guard let partnerConfessed = self.interrogation.partnerDidConfessPreviously else {
            // print("No previous data")
            return .Silent
        }
        
        // Pull current memory value
        var m = self.memory[self.interrogation.partnerName]
        
        // Adapt to partner changes according to rate
        if partnerConfessed == false {
            m += self.rate * (1 - m)
        } else {
            m += self.rate * (0 - m)
        }
        
        // Store in memory
        self.memory[self.interrogation.partnerName] = m
        // print("Memory: \(m)")
        
        return m >= 0.5 ? .Silent : .Confess
    }
}
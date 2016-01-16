//
//  PrisonerMemory.swift
//  Prisoner
//
//  Created by Dan Kane on 1/15/16.
//  Copyright © 2016 Ben Dolmar. All rights reserved.
//

import Foundation

class PrisonerMemory {
    private static let kStorageKey = "PrisonerMemory_Storage"
    
    private var memory: [String : Double] = {
            if let object = NSUserDefaults.standardUserDefaults().objectForKey(PrisonerMemory.kStorageKey) as? [String : Double] {
                return object
            }
            return [String : Double]()
        }()
    
    static let sharedInstance = PrisonerMemory()

    // Override init to prevent external instances
    private init() {}
    
    subscript(partner: String) -> Double {
        get {
            return self.memory[partner] ?? 0.0
        }
        set {
            self.memory[partner] = newValue
            NSUserDefaults.standardUserDefaults().setObject(self.memory, forKey: PrisonerMemory.kStorageKey)
        }
    }
    
    func reset(partner: String? = nil) {
        if let partner = partner {
            self.memory.removeValueForKey(partner)
            NSUserDefaults.standardUserDefaults().setObject(self.memory, forKey: PrisonerMemory.kStorageKey)
        } else {
            NSUserDefaults.standardUserDefaults().removeObjectForKey(PrisonerMemory.kStorageKey)
        }
        print("Data reset")
    }
}
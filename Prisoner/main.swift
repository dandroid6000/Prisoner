//
//  main.swift
//  Prisoner
//
//  Created by Ben Dolmar on 12/14/15.
//  Copyright © 2015 Ben Dolmar. All rights reserved.
//

import Foundation


// I've configured the project's arguments through the scheme; however, I also
// Included a set of debugArguments here in the same format for use during development.
// If you use these be sure to switch back to using the process arguments for your submission.

let debugArguments = [
    "Prisoner", // AppName
    "No 6", // PartnerName
    "mobile", // PartnerDiscipline
    "confess", // PartnerPreviousResponse
    "confess" // PlayerPreviousResponse
]

if let reset = NSProcessInfo.processInfo().arguments[safe: 1] where reset == "reset" {
    // Reset internal data
    let partner = NSProcessInfo.processInfo().arguments[safe: 2]
    PrisonerMemory.sharedInstance.reset(partner)
} else if let interrogation = Interrogation(arguments: NSProcessInfo.processInfo().arguments) {
    // Valid interrogation
    let prisonerConcience = PrisonerConcience(interrogation: interrogation)
    print(prisonerConcience.decide())
} else {
    // Error
    print("Invalid command arguments expected the following format: <partnerName> <partnerDiscipline> [partnerPreviousResponse] [playerPreviousResponse]")
    exit(EXIT_FAILURE)
}

exit(EXIT_SUCCESS)
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
    "Prisoner",
    "No 6",
    "mobile",
    "confess",
    "confess"
]

let interrogation = Interrogation(arguments: NSProcessInfo.processInfo().arguments)

guard let validInterrogation = interrogation else {
    print("Invalid command arguments expected the following format: <partnerName> <partnerDiscipline> [partnerPreviousResponse] [playerPreviousResponse]")
    exit(EXIT_FAILURE)
}

let prisonerConcience = PrisonerConcience(interrogation: validInterrogation)
print(prisonerConcience.decide())

exit(EXIT_SUCCESS)
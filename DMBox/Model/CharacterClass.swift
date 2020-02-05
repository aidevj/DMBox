//
//  CharacterClass.swift
//  DMBox
//
//  Created by Consultant on 1/28/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import Foundation

// Represents a DND class, associated level, and subclass if available
struct CharacterClass {
    var className: String
    var level: Int
    var subclass: String?
}

//
//  PlayerCharacter.swift
//  DMBox
//
//  Created by Consultant on 1/28/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import Foundation

struct PlayerCharacter {
    var name: String
    var classes: [CharacterClass]
    var imagePath: String?
    var playerName: String
    
    var maxHP: Int
    var currentHP: Int
}

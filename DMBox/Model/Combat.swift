//
//  Combat.swift
//  DMBox
//
//  Created by Consultant on 1/29/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import Foundation

struct Combat {
    let title: String
    let description: String
    
    let players: [PlayerCharacter]
    let allies: [PlayerCharacter]
    let enemies: [Monster]
}

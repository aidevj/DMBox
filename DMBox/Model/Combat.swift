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
    
    var players: [PlayerCharacter]
    var allies: [PlayerCharacter]
    var enemies: [Monster]
    
//    init(_ core: CoreCombat) {
//        self.title = core.title!
//        self.description = core.descrip!
//        self.players = core.players!
//    }
}

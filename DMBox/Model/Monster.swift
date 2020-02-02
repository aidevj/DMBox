//
//  Monster.swift
//  DMBox
//
//  Created by Consultant on 1/29/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import Foundation

// returns array of monsters found according to search query
struct MonsterResults: Decodable {
    let results: [Monster]
}

class Monster: Decodable {
    let name: String
    let size: String
    let type: String
    let subtype: String
    let alignment: String
    let armorClass: Double
    let armorDescription: String
    let hitpoints: Int
    let challengeRating: String
//    let walkSpeed: Int?
//    let flySpeed: Int?  // TODO: if speeds are nil, then make = 0, use didset?
//    let swimSpeed: Int?
    
    private enum CodingKeys: String, CodingKey {
        case name, size, type, subtype, alignment
        case armorClass = "armor_class"
        case armorDescription = "armor_desc"
        case hitpoints = "hit_points"
        case challengeRating = "challenge_rating"
    }
    
    init?(_ dict: [String:Any]) {
        guard let _name = dict["name"] as? String,
            let _size = dict["size"] as? String,
            let _type = dict["type"] as? String,
            let _subtype = dict["subtype"] as? String,
            let _alignment = dict["alignment"] as? String,
            let _ac = dict["armor_class"] as? Double,
            let _armorDescription = dict["armor_desc"] as? String,
            let _hitpoints = dict["hit_points"] as? Int,
            let _cr = dict["challenge_rating"] as? String else { return nil }
            
            // TODO: test
            //let speedDict = dict["speed"] as? [String?:Any],
            //let _walkSpeed = speedDict["walk"] as? Int,
            //let _flySpeed = speedDict["fly"] as? Int,
            //let _swimSpeed = speedDict["walk"] as? Int else { return nil }
        
        self.name = _name
        self.size = _size
        self.type = _type
        self.subtype = _subtype
        self.alignment = _alignment
        self.armorClass = _ac
        self.armorDescription = _armorDescription
        self.hitpoints = _hitpoints
        self.challengeRating = _cr
        /*
        self.walkSpeed = _walkSpeed
        self.flySpeed = _flySpeed
        self.swimSpeed = _swimSpeed
         */
    }
    
}

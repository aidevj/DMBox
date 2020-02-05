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
    let armorClass: Int64?
    let armorDescription: String?
    let hitpoints: Int64?
    let challengeRating: String
    let strScore: Int64
    let dexScore: Int64
    let conScore: Int64
    let intScore: Int64
    let wisScore: Int64
    let chaScore: Int64
    let strSave: Int64?
    let dexSave: Int64?
    let conSave: Int64?
    let intSave: Int64?
    let wisSave: Int64?
    let chaSave: Int64?
    let walkSpeed: Int64?
    let flySpeed: Int64?
    let swimSpeed: Int64?
    let climbSpeed: Int64?
    
    private enum CodingKeys: String, CodingKey {
        case name, size, type, subtype, alignment
        case armorClass = "armor_class"
        case armorDescription = "armor_desc"
        case hitpoints = "hit_points"
        case challengeRating = "challenge_rating"
        case strScore = "strength"
        case dexScore = "dexterity"
        case conScore = "constitution"
        case intScore = "intelligence"
        case wisScore = "wisdom"
        case chaScore = "charisma"
        case strSave = "strength_save"
        case dexSave = "dexterity_save"
        case conSave = "consitution_save"
        case intSave = "intelligence_save"
        case wisSave = "wisdom_save"
        case chaSave = "charisma_save"
        case walkSpeed = "walk"
        case flySpeed = "fly"
        case swimSpeed = "swim"
        case climbSpeed = "climb"
    }
    
    init(_ name: String? = nil,
        _ size: String? = nil,
        _ type: String? = nil,
        _ subtype: String? = nil,
        _ alignment: String? = nil,
        _ armorClass: Int64? = nil,
        _ armorDescription: String? = nil,
        _ hitpoints: Int64? = nil,
        _ challengeRating: String? = nil,
        _ strScore: Int64? = nil,
        _ dexScore: Int64? = nil,
        _ conScore: Int64? = nil,
        _ intScore: Int64? = nil,
        _ wisScore: Int64? = nil,
        _ chaScore: Int64? = nil,
        _ strSave: Int64? = nil,
        _ dexSave: Int64? = nil,
        _ conSave: Int64? = nil,
        _ intSave: Int64? = nil,
        _ wisSave: Int64? = nil,
        _ chaSave: Int64? = nil,
        _ walkSpeed: Int64? = nil,
        _ flySpeed: Int64? = nil,
        _ swimSpeed: Int64? = nil,
        _ climbSpeed: Int64? = nil
    ) {
        self.name = name!
        self.size = size!
        self.type = type!
        self.subtype = subtype!
        self.alignment = alignment!
        self.armorClass = armorClass!
        self.armorDescription = armorDescription!
        self.hitpoints = hitpoints!
        self.challengeRating = challengeRating!
        self.strScore = strScore!
        self.dexScore = dexScore!
        self.conScore = conScore!
        self.intScore = intScore!
        self.wisScore = wisScore!
        self.chaScore = chaScore!
        self.strSave = strSave!
        self.dexSave = dexSave!
        self.conSave = conSave!
        self.intSave = intSave!
        self.wisSave = wisSave!
        self.chaSave = chaSave!
        self.walkSpeed = walkSpeed!
        self.flySpeed = flySpeed!
        self.swimSpeed = swimSpeed!
        self.climbSpeed = climbSpeed!
    }
    
    
    init?(_ dict: [String:Any]) {
        guard let _name = dict["name"] as? String,
            let _size = dict["size"] as? String,
            let _type = dict["type"] as? String,
            let _subtype = dict["subtype"] as? String,
            let _alignment = dict["alignment"] as? String,
            let _ac = dict["armor_class"] as? Int64,
            let _armorDescription = dict["armor_desc"] as? String,
            let _hitpoints = dict["hit_points"] as? Int64,
            let _cr = dict["challenge_rating"] as? String,
            let _strScore = dict["strength"] as? Int64,
            let _dexScore = dict["dexterity"] as? Int64,
            let _conScore = dict["constitution"] as? Int64,
            let _intScore = dict["intelligence"] as? Int64,
            let _wisScore = dict["wisdom"] as? Int64,
            let _chaScore = dict["charisma"] as? Int64,
            let _strSave = dict["strength_save"] as? Int64,
            let _dexSave = dict["dexterity_save"] as? Int64,
            let _conSave = dict["constitution_save"] as? Int64,
            let _intSave = dict["intelligence_save"] as? Int64,
            let _wisSave = dict["wisdom_save"] as? Int64,
            let _chaSave = dict["charisma_save"] as? Int64,
            let speedDict = dict["speed"] as? [String:Any],
            let _walkSpeed = speedDict["walk"] as? Int64,
            let _flySpeed = speedDict["fly"] as? Int64,
            let _swimSpeed = speedDict["swim"] as? Int64,
            let _climbSpeed = speedDict["climb"] as? Int64 else { return nil }
            
            
            // TODO: test
            //let speedDict = dict["speed"] as? [String?:Any],
            //let _walkSpeed = speedDict["walk"] as? Int,
            //let _flySpeed = speedDict["fly"] as? Int,
            //let _swimSpeed = speedDict["walk"] as? Int else { return nil }
        
        self.name = _name
        self.size = _size.capitalizingFirstLetter()
        self.type = _type.capitalizingFirstLetter()
        self.subtype = _subtype
        self.alignment = _alignment
        self.armorClass = _ac
        self.armorDescription = _armorDescription
        self.hitpoints = _hitpoints
        self.challengeRating = _cr
        self.strScore = _strScore
        self.dexScore = _dexScore
        self.conScore = _conScore
        self.intScore = _intScore
        self.wisScore = _wisScore
        self.chaScore = _chaScore
        self.strSave = _strSave
        self.dexSave = _dexSave
        self.conSave = _conSave
        self.intSave = _intSave
        self.wisSave = _wisSave
        self.chaSave = _chaSave
        self.walkSpeed = _walkSpeed
        self.flySpeed = _flySpeed
        self.swimSpeed = _swimSpeed
        self.climbSpeed = _climbSpeed
        
        /*
        self.walkSpeed = _walkSpeed
        self.flySpeed = _flySpeed
        self.swimSpeed = _swimSpeed
         */
    }
    
}

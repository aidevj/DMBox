//
//  DndAPI.swift
//  DMBox
//
//  Created by Consultant on 1/29/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import Foundation

struct DndAPI {
    
    //http://dnd5eapi.co/api/monsters/adult-black-dragon/
    
    let base = "http://dnd5eapi.co/api"
    
    var searchTerm: String!
    var id: String!
    
    init(_ searchTerm: String? = nil, _ id: String? = nil) {
        self.searchTerm = searchTerm
        self.id = id
    }
    
    // MARK: Search Category URL Requests
    
    // For use when searching through monsters
    var monsterURL: URL? {
        guard let query = searchTerm else { return nil }
        return URL(string: base + "/monsters" + "/\(query)")
    }
    
    // For use when searching through spells
    var spellURL: URL? {
        guard let query = searchTerm else { return nil }
        return URL(string: base + "/spells" + "/\(query)")
    }
    
    
    
}

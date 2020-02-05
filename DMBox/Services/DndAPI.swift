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
    
    //api.open5e.com/monsters/?challenge_rating=3
    // Specific Searches
        //https://api.open5e.com/monsters/?search=fire
    // General search
        //https://api.open5e.com/search/?text=fire
    
    let base = "https://api.open5e.com"
    
    let search = "/?search="
    
    var searchTerm: String!
    
    init(_ searchTerm: String? = nil) {
        self.searchTerm = searchTerm
    }
    
    // MARK: Search Category URL Requests
    
    // For use when searching through monsters
    var monsterURL: URL? {
        guard let query = searchTerm else { return nil }
        print("Search URL:" + base + "/monsters" + search + query)
        return URL(string: base + "/monsters" + search + query)
    }
    
    // For use when searching through spells
    var spellURL: URL? {
        guard let query = searchTerm else { return nil }
        return URL(string: base + "/spells" + search + query)
    }
    
    
    
}

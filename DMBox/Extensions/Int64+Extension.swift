//
//  Int64+Extension.swift
//  DMBox
//
//  Created by Consultant on 2/6/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import Foundation

extension Int64 {
    
    var toAbilityModifierAsString: String {
        let modifier = (Double(self) - 10.0) / 2.0
        
        if modifier < 0 {
            return String(Int(modifier))
        } else {
            return "+" + String(Int(modifier))
        }
    }
    
}

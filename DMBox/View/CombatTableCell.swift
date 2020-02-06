//
//  CombatTableCell.swift
//  DMBox
//
//  Created by Consultant on 1/29/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit

class CombatTableCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var enemiesLabel: UILabel!
    
    static let identifier = "CombatTableCell"
    
    var combat: Combat! {
        didSet {
            titleLabel.text = combat.title
            
            var enemiesList = "Enemies: "
            if (combat.enemies.count != 0) {
                let enemies = combat.enemies
                
                for enemy in enemies {
                    enemiesList += " \(enemy.name),"
                }
                enemiesList = String(enemiesList.dropLast())
            }
            else {
                enemiesList += "(none)"
            }
            
            enemiesLabel.text = enemiesList
            
            
            
        }
    }
    
}

//
//  MonsterDetailTableCell.swift
//  DMBox
//
//  Created by Consultant on 2/6/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit

class MonsterDetailTableCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var sizeTypeAlignLabel: UILabel!
    @IBOutlet weak var armorClassLabel: UILabel!
    @IBOutlet weak var hitpointsLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var strScoreLabel: UILabel!
    @IBOutlet weak var dexScoreLabel: UILabel!
    @IBOutlet weak var conScoreLabel: UILabel!
    @IBOutlet weak var intScoreLabel: UILabel!
    @IBOutlet weak var wisScoreLabel: UILabel!
    @IBOutlet weak var chaScoreLabel: UILabel!
    
    static let identifier = "MonsterDetailTableCell"

    var monster: Monster! {
        didSet {
            nameLabel.text = monster.name
            sizeTypeAlignLabel.text = "\(monster.size) \(monster.type), \(monster.alignment)"
            
            armorClassLabel.text = "\(monster.armorClass ?? 0) (\(monster.armorDescription ?? ""))"
            hitpointsLabel.text = "\(monster.hitpoints ?? 0)"
            
            // TODO: account for other types of movement
            if monster.walkSpeed != nil {
                speedLabel.text = "\(monster.walkSpeed ?? 0)ft."
            } else {
                speedLabel.text = ""
            }
            
            strScoreLabel.text = "\(monster.strScore)(\(monster.strScore.toAbilityModifierAsString))"
            dexScoreLabel.text = "\(monster.dexScore)(\(monster.dexScore.toAbilityModifierAsString))"
            conScoreLabel.text = "\(monster.conScore)(\(monster.conScore.toAbilityModifierAsString))"
            intScoreLabel.text = "\(monster.intScore)(\(monster.intScore.toAbilityModifierAsString))"
            wisScoreLabel.text = "\(monster.wisScore)(\(monster.wisScore.toAbilityModifierAsString))"
            chaScoreLabel.text = "\(monster.chaScore)(\(monster.chaScore.toAbilityModifierAsString))"
            
            
        }
    }
    
    
    
}

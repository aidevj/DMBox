//
//  MonDetailTableCell.swift
//  DMBox
//
//  Created by Consultant on 2/5/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit

class MonDetailTableCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var sizeTypeAlignmentLabel: UILabel!
    @IBOutlet weak var armorClassLabel: UILabel!
    @IBOutlet weak var hitpointsLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var strScoreLabel: UILabel!
    @IBOutlet weak var dexScoreLabel: UILabel!
    @IBOutlet weak var conScoreLabel: UILabel!
    @IBOutlet weak var intScoreLabel: UILabel!
    @IBOutlet weak var wisScoreLabel: UILabel!
    @IBOutlet weak var chaScoreLabel: UILabel!
    
    static let identifier = "MonDetailTableCell"
    
    var monster: Monster! {
        didSet {
            nameLabel.text = monster.name
//            sizeTypeAlignmentLabel.text = "\(monster.size) \(monster.type), \(monster.alignment)"
//            armorClassLabel.text = "\(monster.armorClass) (\(monster.armorDescription))"
//            hitpointsLabel.text = "\(monster.hitpoints)"
//            speedLabel.text = ""
//
//            strScoreLabel.text = "\(monster.strScore)(\((monster.strScore - 10)/2))"
//            dexScoreLabel.text = "\(monster.dexScore)(\((monster.dexScore - 10)/2))"
//            conScoreLabel.text = "\(monster.conScore)(\((monster.conScore - 10)/2))"
//            intScoreLabel.text = "\(monster.intScore)(\((monster.intScore - 10)/2))"
//            wisScoreLabel.text = "\(monster.wisScore)(\((monster.wisScore - 10)/2))"
//            chaScoreLabel.text = "\(monster.chaScore)(\((monster.chaScore - 10)/2))"
            
            
        }
    }
    
}

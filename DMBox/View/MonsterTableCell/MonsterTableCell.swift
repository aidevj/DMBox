//
//  MonsterTableCell.swift
//  DMBox
//
//  Created by Consultant on 2/3/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit

class MonsterTableCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descripLabel: UILabel!
    @IBOutlet weak var crNumLabel: UILabel!
    @IBOutlet weak var crTitleLabel: UILabel!   // not dynamic text
    
    var monster: Monster! {
        didSet {
            let type = monster.type.capitalizingFirstLetter()
            let align = monster.alignment.capitalizingFirstLetter()
            
            nameLabel.text = monster.name
            descripLabel.text = "\(type) | \(monster.size) | \(align)"
            crNumLabel.text = monster.challengeRating
        }
    }
    
    static let identifier = "MonsterTableCell"
    
    override func layoutSubviews() {
        crTitleLabel.adjustsFontSizeToFitWidth = false
        nameLabel.adjustsFontSizeToFitWidth = false
        nameLabel.lineBreakMode = NSLineBreakMode.byTruncatingTail
        descripLabel.adjustsFontSizeToFitWidth = false
        descripLabel.lineBreakMode = NSLineBreakMode.byTruncatingTail
    }
}

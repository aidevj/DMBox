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
    
    var monster: Monster! {
        didSet {
            nameLabel.text = monster.name
            descripLabel.text = "\(monster.type) | \(monster.size) | \(monster.alignment)"
            crNumLabel.text = monster.challengeRating
        }
    }
    
    static let identifier = "MonsterTableCell"
    
    override func layoutSubviews() {
        descripLabel.adjustsFontSizeToFitWidth = false
        descripLabel.lineBreakMode = NSLineBreakMode.byTruncatingTail
    }
}

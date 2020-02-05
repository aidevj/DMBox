//
//  PlayerViewCell.swift
//  DMBox
//
//  Created by Consultant on 1/28/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit

class PlayerViewCell: UITableViewCell {
    
    //MARK: Properties
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var classLabel: UILabel!
    @IBOutlet weak var playerNameLabel: UILabel!
    
    static let identifier = "PlayerViewCell"
    
    var player: PlayerCharacter! {
        didSet {
            nameLabel.text = player.name
            
            var classString: String = ""
            for playerClass in player.classes {
                classString += "Lv \(playerClass.level) \(playerClass.className) "
            }
            classLabel.text = classString
            
            //playerNameLabel.text = player.
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

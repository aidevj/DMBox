//
//  CombatViewController.swift
//  DMBox
//
//  Created by Consultant on 1/29/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit

class CombatViewController: UIViewController {
    
    @IBOutlet weak var addMonsterButton: UIButton!
    @IBOutlet weak var addPlayerButton: UIButton!
    @IBOutlet weak var combatsTableView: UITableView!
    
    var combatList: [Combat] = []

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: Setup Functions
    
    private func setupTable () {
        combatsTableView.register(UINib(nibName: CombatTableCell.identifier, bundle: Bundle.main), forCellReuseIdentifier: CombatTableCell.identifier)
        combatsTableView.tableFooterView = UIView(frame: .zero)
        combatsTableView.backgroundColor = .none
        
    }


}

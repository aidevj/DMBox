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
    
    //var combatList: [Combat] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTable()
    }
    
    // MARK: Setup Functions
    
    private func setupTable () {
        combatsTableView.register(UINib(nibName: CombatTableCell.identifier, bundle: Bundle.main), forCellReuseIdentifier: CombatTableCell.identifier)
        combatsTableView.tableFooterView = UIView(frame: .zero)
        combatsTableView.backgroundColor = .none
        
    }

}

extension CombatViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3 // TEMP
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CombatTableCell.identifier, for: indexPath) as! CombatTableCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    
    
    
}

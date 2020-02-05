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
    
    var viewModel: ViewModel!
    //var combatList: [Combat] = []
    var sampleCombatList: [Combat] = []     // TEST PURPOSES

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    // MARK: Setup Functions
    
    private func setupView () {
        combatsTableView.register(UINib(nibName: CombatTableCell.identifier, bundle: Bundle.main), forCellReuseIdentifier: CombatTableCell.identifier)
        combatsTableView.tableFooterView = UIView(frame: .zero)
        combatsTableView.backgroundColor = .none
        
        // Set up Navigation buttons programatically
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addMonstersTapped))
    }
    
    //TESTING PURPOSES---------------
    private func setupDummyData() {
        sampleCombatList = [
            
        ]
        // "id":Int and "view name":String
        // i.e. 0. PlayersViewController
        //      1. CombatViewController
    }
    //-------------------
    
    
    @objc func addMonstersTapped(sender: UIButton) {
        //print("Add Mons tapped")
        let nextVC = storyboard?.instantiateViewController(withIdentifier: "MonsterSearchViewController") as! MonsterSearchViewController
        nextVC.hidesBottomBarWhenPushed = true
        navigationController?.view.backgroundColor = .none
        navigationController?.pushViewController(nextVC, animated: true)
        nextVC.viewModel = viewModel
    }

}

extension CombatViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3 // TEMP // TODO: Combat section, players section
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

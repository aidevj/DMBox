//
//  CombatViewController.swift
//  DMBox
//
//  Created by Consultant on 1/29/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit

class CombatViewController: UIViewController {
    
    //@IBOutlet weak var addMonsterButton: UIButton!
    //@IBOutlet weak var addPlayerButton: UIButton!
    @IBOutlet weak var combatsTableView: UITableView!
    
    var viewModel: ViewModel!
    var sampleCombatList: [Combat] = []     // TEST PURPOSES

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupDummyData()
    }
    
    // MARK: Setup Functions
    
    private func setupView () {
        combatsTableView.register(UINib(nibName: CombatTableCell.identifier, bundle: Bundle.main), forCellReuseIdentifier: CombatTableCell.identifier)
        combatsTableView.tableFooterView = UIView(frame: .zero)
        combatsTableView.backgroundColor = .none
        
        viewModel.delegate = self
    }
    
    //TESTING PURPOSES---------------
    private func setupDummyData() {
        viewModel.dummyCombatList = [
            Combat(title: "Sample Encounter #1", description: "Lorem ipsum",
                   players: [
                    PlayerCharacter(name: "John Cena", classes: [CharacterClass(className: "Bard", level: 10, subclass: "College of Glamor")], imagePath: nil, playerName: "Aiden", maxHP: 57, currentHP: 57),
                    PlayerCharacter(name: "Annie May", classes: [CharacterClass(className: "Warlock", level: 6, subclass: "Raven Queen"), CharacterClass(className: "Sorcerer", level: 4, subclass: "Clockwork Soul")], imagePath: nil, playerName: "Ima Weeb", maxHP: 70, currentHP: 70)
                ],
                   allies: [],
                   enemies: [
                    Monster("Playground Bully", "Small", "Meanie", "Weakling", "Neutral Evil", 10, "", 100, "1/2", 10, 10, 10, 10, 10, 10, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0),
                    Monster("Playground Bully 2", "Small", "Meanie", "Weakling", "Neutral Evil", 10, "", 100, "1", 10, 10, 10, 10, 10, 10, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0),
                    Monster("Substitute Teacher", "Large", "Educational", "Temporary", "Lawful Neutral", 10, "", 100, "12", 10, 10, 10, 10, 10, 10, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0)
            ]),
            Combat(title: "Sample Encounter #2", description: "Lorem ipsum", players: [], allies: [], enemies: []),
            Combat(title: "Sample Encounter #3", description: "Lorem ipsum", players: [], allies: [], enemies: []),
            Combat(title: "Sample Encounter #4", description: "Lorem ipsum", players: [], allies: [], enemies: [])
        ]
    }
    //-------------------

}

extension CombatViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dummyCombatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CombatTableCell.identifier, for: indexPath) as! CombatTableCell
        
        cell.combat = viewModel.dummyCombatList[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let nextVC = storyboard?.instantiateViewController(withIdentifier: "CombatDetailsViewController") as! CombatDetailsViewController
        nextVC.viewModel = viewModel
        nextVC.currentCombat = indexPath.row
        
        nextVC.hidesBottomBarWhenPushed = true
        navigationController?.view.backgroundColor = .none
        navigationController?.pushViewController(nextVC, animated: true)
    }

}

extension CombatViewController: ViewModelDelegate {
    func update() {
        DispatchQueue.main.async {
            self.combatsTableView.reloadData()
        }
    }
    
    
}

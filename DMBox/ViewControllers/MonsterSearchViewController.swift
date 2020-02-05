//
//  MonsterSearchViewController.swift
//  DMBox
//
//  Created by Consultant on 2/2/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit

class MonsterSearchViewController: UIViewController {

    @IBOutlet weak var monsterTableView: UITableView!
    
    // to be passed from last VC
    var viewModel: ViewModel!
    
    var monsters: [Monster] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupDummyData()
    }
    
    // MARK: Setup Functions
    private func setupView() {
        monsterTableView.register(UINib(nibName: MonsterTableCell.identifier, bundle: Bundle.main), forCellReuseIdentifier: MonsterTableCell.identifier)
        monsterTableView.tableFooterView = UIView(frame: .zero)
        monsterTableView.backgroundColor = .none
        
        viewModel.delegate = self
        
        // TEST----------
        viewModel.getMonsters("Fire")

    }
    
    // TEST---------------------------
    private func setupDummyData() {
        monsters = [
//            Monster("Croc Monster", "Gargantuan", "Meme", "meme2", "Chaotic Evil", 1, "Natural Armor", 500, "13"),
//            Monster("Fao", "Medium", "Meme", "memey", "Chaotic Neutral", 1, "Woof", 500, "1/4"),
//            Monster("Croc Monster", "Gargantuan", "Meme", "meme2", "Chaotic Evil", 1, "Natural Armor", 500, "1/2")
            Monster("Croc Monster"),
            Monster("Fao"),
            Monster("Fao Monster")
        ]
    }
    //--------------------------------
    
}

extension MonsterSearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return monsters.count // TEST
        return viewModel.monsters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MonsterTableCell.identifier, for: indexPath) as! MonsterTableCell
        
        cell.monster = viewModel.monsters[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}

//MARK: ViewModel Delegate extension
extension MonsterSearchViewController: ViewModelDelegate {
    func update() {
        DispatchQueue.main.async {
            self.monsterTableView.reloadData()
        }
    }
    
    
}

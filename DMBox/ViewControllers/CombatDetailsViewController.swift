//
//  CombatDetailsViewController.swift
//  DMBox
//
//  Created by Consultant on 2/5/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit

class CombatDetailsViewController: UIViewController {

    @IBOutlet weak var combatDetailsTableView: UITableView!
    
    var viewModel: ViewModel!
    
    var currentCombat: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    //MARK: Set Up Funcs
    
    private func setupView() {
        combatDetailsTableView.register(UINib(nibName: PlayerViewCell.identifier, bundle: Bundle.main), forCellReuseIdentifier: PlayerViewCell.identifier)
        combatDetailsTableView.register(UINib(nibName: MonsterTableCell.identifier, bundle: Bundle.main), forCellReuseIdentifier: MonsterTableCell.identifier)
        combatDetailsTableView.tableFooterView = UIView(frame: .zero)
        combatDetailsTableView.backgroundColor = .none
        
        viewModel.delegate = self  
        
        // Set up Navigation buttons programatically
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addMonstersTapped))
    }
    
    private func showAlert() {
        let combatName = viewModel.dummyCombatList[currentCombat].title
        let alert = UIAlertController(title: "Add to \(combatName)", message: "", preferredStyle: .actionSheet)

        alert.addAction(UIAlertAction(title: "Existing Player Character (unavail)", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "New Player Character (unavail)", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "Existing Monster", style: .default, handler: { action in
            let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "MonsterSearchViewController") as! MonsterSearchViewController
            nextVC.hidesBottomBarWhenPushed = true
            self.navigationController?.view.backgroundColor = .none
            self.navigationController?.pushViewController(nextVC, animated: true)
            nextVC.viewModel = self.viewModel
        }))
        alert.addAction(UIAlertAction(title: "New Monster (unavail)", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))

        self.present(alert, animated: true)
    }
    
    @objc func addMonstersTapped(sender: UIButton) {
            showAlert()
       }

}

extension CombatDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    
    // Set up 3 sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return viewModel.dummyCombatList[currentCombat].players.count
        case 1:
            return 1 // TODO: Allies section
        case 2:
            return viewModel.dummyCombatList[currentCombat].enemies.count
            // return viewModel this combat's saved list of monsters
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: PlayerViewCell.identifier, for: indexPath) as! PlayerViewCell
            
            let player = viewModel.dummyCombatList[currentCombat].players[indexPath.row]
            
            cell.player = player
            
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: PlayerViewCell.identifier, for: indexPath) as! PlayerViewCell  // TODO: need to change to NPC cell type later
            
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: MonsterTableCell.identifier, for: indexPath) as! MonsterTableCell
            
            let monster = viewModel.dummyCombatList[currentCombat].enemies[indexPath.row]
            
            // TODO: turn off + button in this view, toggle or otherwise make a different reusable table cell for monsters to be used in thsi view specifically
            
            cell.monster = monster
            return cell
        default:
            return UITableViewCell.init()
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Player Characters"
        case 1:
            return "NPCs"
        case 2:
            return "Enemies"
        default:
            return ""
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

extension CombatDetailsViewController: ViewModelDelegate {
    func update() {
        DispatchQueue.main.async {
            self.combatDetailsTableView.reloadData()
        }
    }
}

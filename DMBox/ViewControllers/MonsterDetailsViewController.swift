//
//  MonsterDetailsViewController.swift
//  DMBox
//
//  Created by Consultant on 2/5/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit

class MonsterDetailsViewController: UIViewController {

    @IBOutlet weak var monsterDetailsTableView: UITableView!
    
    var viewModel: ViewModel!
    
//    var currentMonster: Monster!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: Setup Functions
    private func setupView() {
//        monsterDetailsTableView.register(UINib(nibName: MonsterDetailTableCell.identifier, bundle: Bundle.main), forCellReuseIdentifier: MonsterDetailTableCell.identifier)
        monsterDetailsTableView.tableFooterView = UIView(frame: .zero)
        monsterDetailsTableView.backgroundColor = .none
        
        viewModel.delegate = self
    }

}

//MARK: ViewModel Delegate extension
extension MonsterDetailsViewController: ViewModelDelegate {
    func update() {
        DispatchQueue.main.async {
            self.monsterDetailsTableView.reloadData()
        }
    }
}

extension MonsterDetailsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MonsterDetailTableCell", for: indexPath) as! MonsterDetailTableCell
        
        cell.monster = viewModel.currentMonster
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


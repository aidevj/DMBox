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
    
    let searchController = UISearchController(searchResultsController: nil)
    
    //var filteredMonsters = [Monster]()
    
    var isFiltering: Bool {
        return !searchController.searchBar.text!.isEmpty && searchController.isActive
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupSearch()
        getData()
    }
    
    // MARK: Setup Functions
    private func setupView() {
        monsterTableView.register(UINib(nibName: MonsterTableCell.identifier, bundle: Bundle.main), forCellReuseIdentifier: MonsterTableCell.identifier)
        monsterTableView.tableFooterView = UIView(frame: .zero)
        monsterTableView.backgroundColor = .none
        monsterTableView.separatorStyle = .none
        
        viewModel.delegate = self
    }
    
    private func setupSearch() {
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.searchController = searchController
    }
    
    private func getData() {
        viewModel.getMonsters("") // get all monsters, API only loads first 50?
    }
    
    private func filter(with search: String) {
//        filteredMonsters = [] // clear array with every change
//
//        viewModel.getMonsters(search)
        
//        filteredMonsters = viewModel.monsters.filter({
//            $0.name.uppercased().contains(search.uppercased())
//        })
        
        
//        monsterTableView.reloadData()
//
//        if (filteredMonsters.isEmpty) {
//            //viewModel.getMonsters("")
//            print("Filteed monsters is empty")
//        }
    }
    
}

extension MonsterSearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.monsters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MonsterTableCell.identifier, for: indexPath) as! MonsterTableCell
        
        let monsters = viewModel.monsters
        
        cell.monster = monsters[indexPath.row]
        
        // add + button
        
        
        return cell
    }
    
}

extension MonsterSearchViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        // To Monster Detail View
        
        let nextVC = storyboard?.instantiateViewController(withIdentifier: "MonsterDetailsViewController") as! MonsterDetailsViewController
        nextVC.viewModel = viewModel
        let monster = viewModel.monsters[indexPath.row]
        viewModel.currentMonster = monster
        
        nextVC.hidesBottomBarWhenPushed = true
        navigationController?.view.backgroundColor = .none
        navigationController?.pushViewController(nextVC, animated: true)
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

//MARK: Search Bar Delegate extension
extension MonsterSearchViewController: UISearchBarDelegate, UISearchResultsUpdating {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let search = searchBar.text,
            let sanitized = search.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { return }

        viewModel.getMonsters(sanitized)
        //filter(with: sanitized)
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let search = searchController.searchBar.text,
            let sanitized = search.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { return }
        
        viewModel.getMonsters(sanitized)
        //filter(with: sanitized)
        
    }
}

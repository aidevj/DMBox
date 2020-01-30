//
//  CampaignViewController.swift
//  DMBox
//
//  Created by Consultant on 1/28/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit

class CampaignViewController: UIViewController {

    @IBOutlet weak var campaignTableView: UITableView!
    
    var data: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()
        
        setupDummyData()
        DispatchQueue.main.async {
            self.campaignTableView.reloadData()
        }
        
    }
    
    // MARK: Setup Functions
    
    private func setupTable() {
        campaignTableView.register(UINib(nibName: CampaignElementViewCell.identifier, bundle: Bundle.main), forCellReuseIdentifier: CampaignElementViewCell.identifier)
        
        campaignTableView.tableFooterView = UIView(frame: .zero)
        campaignTableView.separatorStyle = .none
        campaignTableView.backgroundColor = .none
        
        //TODO: view model delgate to self
    }
    
    //TESTING PURPOSES---------------
    private func setupDummyData() {
        data = ["Player Characters", "Combat & Encounters"]
        // "id":Int and "view name":String
        // i.e. 0. PlayersViewController
        //      1. CombatViewController
    }
    //-------------------

}

extension CampaignViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count   // TEMP
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CampaignElementViewCell.identifier, for: indexPath) as! CampaignElementViewCell
        let rowData = data[indexPath.row]
        cell.elementNameLabel.text = rowData
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 128
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        // Go to appropriate VC
        let selected = indexPath.row
        
        switch selected {
        case 0:
            break
        case 1:
            print("Combat selected")
            let nextVC = storyboard?.instantiateViewController(withIdentifier: "CombatViewController") as! CombatViewController
            //nextVC.viewModel = viewModel
            nextVC.hidesBottomBarWhenPushed = true
            navigationController?.view.backgroundColor = .none
            navigationController?.pushViewController(nextVC, animated: true)
        default:
            break
        }
        
        
    }
    
    
}

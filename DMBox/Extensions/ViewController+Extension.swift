//
//  ViewController+Extension.swift
//  DMBox
//
//  Created by Consultant on 2/5/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func showAlert(title: String?, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        //let addExistingPCAction = UIAlertAction(title: "Add Existing Player", style: .default, handler: nil)
        let addNewPCAction = UIAlertAction(title: "Add Player", style: .default, handler: nil)
        let addMonsterAction = UIAlertAction(title: "Add Monster", style: .default, handler: nil)
        
        alert.addAction(addNewPCAction)
        alert.addAction(addMonsterAction)
        
        present(alert, animated: true, completion: nil)
    }
}

//
//  ViewModel.swift
//  DMBox
//
//  Created by Consultant on 1/29/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import Foundation

protocol ViewModelDelegate: class {
    func update()
}

class ViewModel {
    weak var delegate: ViewModelDelegate?
    
    var playerCharacters = [PlayerCharacter]() {
        didSet {
            delegate?.update()
        }
    }
    
    var monsters = [Monster]() {
        didSet {
            delegate?.update()
        }
    }
    
    var currentPlayerCharacter: PlayerCharacter! {
        didSet {
            
        }
    }
    
}

extension ViewModel {
    func getMonsters(_ monsterName: String) {
        API.getMonstersFromApi(for: monsterName) { [weak self] apiResult in
            switch apiResult {
            case .success(let monsters):
                self?.monsters = monsters
                print("Monsters Count: \(monsters.count)")
            case .failure(let error):
                print("API Failure: \(error.localizedDescription)") // DEBUG
            }
        }
    }
}

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
    
    var currentPlayerCharacter: PlayerCharacter! {
        didSet {
            
        }
    }
    
}

extension ViewModel {
    
}

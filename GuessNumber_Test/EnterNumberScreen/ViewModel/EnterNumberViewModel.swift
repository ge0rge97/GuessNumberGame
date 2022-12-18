//
//  EnterNumberViewModel.swift
//  GuessNumber_Test
//
//  Created by Georgiy Groshev on 18.12.2022.
//

import Foundation

protocol EnterNumberViewModelProtocol {
    func getMaximumNumber() -> Int
}

class EnterNumberViewModel: EnterNumberViewModelProtocol {
    
    private var gameSystem = GameSystem()
    
    func getMaximumNumber() -> Int {
        return try! gameSystem.load(R.UserDefaultsKeys.maximumNumber).state.difficultLevel.rawValue
    }
}

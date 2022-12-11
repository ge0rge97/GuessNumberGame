//
//  RestartGameViewModel.swift
//  GuessNumber_Test
//
//  Created by Georgiy Groshev on 10.12.2022.
//

import Foundation

protocol RestartGameViewModelProtocol {
    
    func restartGame()
}

class RestartGameViewModel: RestartGameViewModelProtocol {
    
    private let userDefaults = UserDefaults.standard
    
    func restartGame() {
        
        userDefaults.removeObject(forKey: R.UserDefaultsKeys.computerRound)
        userDefaults.removeObject(forKey: R.UserDefaultsKeys.playerRound)
        userDefaults.removeObject(forKey: R.UserDefaultsKeys.maximumNumber)
    }
}

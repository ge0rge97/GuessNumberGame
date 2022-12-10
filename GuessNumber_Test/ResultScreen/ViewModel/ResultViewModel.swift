//
//  ResultViewModel.swift
//  GuessNumber_Test
//
//  Created by Georgiy Groshev on 09.12.2022.
//

import Foundation

protocol ResultViewModelProtocol: AnyObject {
    
    func getGameResult() -> String
}

class ResultViewModel: ResultViewModelProtocol {
    
    private var numberOfComputerTries: Int
    
    private var numberOfPlayersTries: Int
    
    private let userDefaults = UserDefaults.standard
    
    init() {
        
        self.numberOfComputerTries = userDefaults.integer(forKey: R.UserDefaultsKeys.computerRound)
        
        self.numberOfPlayersTries = userDefaults.integer(forKey: R.UserDefaultsKeys.playerRound)
    }
    
    func getGameResult() -> String {
        
        if numberOfPlayersTries > numberOfComputerTries {
            
            return ResultsModels.computerWin.title
            
        } else if numberOfComputerTries > numberOfPlayersTries {
            
            return ResultsModels.playerWin.title
            
        } else {
            
            return ResultsModels.draw.title
        }
    }
}

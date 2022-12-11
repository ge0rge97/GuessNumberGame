//
//  ResultsModels.swift
//  GuessNumber_Test
//
//  Created by Georgiy Groshev on 09.12.2022.
//

import Foundation

struct ResultsModels {
    
    var numberOfComputerTries: Int
    
    var numberOfPlayersTries: Int
    
    var results: Results
    
    init(results: Results) {
        
        let userDefaults = UserDefaults.standard
        
        self.numberOfComputerTries = userDefaults.integer(forKey: R.UserDefaultsKeys.computerRound)
        
        self.numberOfPlayersTries = userDefaults.integer(forKey: R.UserDefaultsKeys.playerRound)
        
        self.results = results
    }
}

extension ResultsModels {
    
    enum Results: String {
        
        case computerWin
        case playerWin
        case draw
        
        var title: String {
            
            switch self {
            case .computerWin:
                return "Computer win"
            case .playerWin:
                return "You win"
            case .draw:
                return "It's draw"
            }
        }
    }
}

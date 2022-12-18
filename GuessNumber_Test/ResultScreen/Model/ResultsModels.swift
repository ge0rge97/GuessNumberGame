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
    
    private let gameSystem = GameSystem()
    
    init(results: Results) {
        self.numberOfComputerTries = try! gameSystem.load(R.UserDefaultsKeys.computerRound).state.numberOfTries
        self.numberOfPlayersTries = try! gameSystem.load(R.UserDefaultsKeys.playerRound).state.numberOfTries
        self.results = results
    }
}
//MARK: - Results
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

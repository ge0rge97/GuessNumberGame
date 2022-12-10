//
//  ResultsModels.swift
//  GuessNumber_Test
//
//  Created by Georgiy Groshev on 09.12.2022.
//

import Foundation

enum ResultsModels: String {
    
    case computerWin
    case playerWin
    case draw
}

extension ResultsModels {
    
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

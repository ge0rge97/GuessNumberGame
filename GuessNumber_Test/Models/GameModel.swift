//
//  GameModel.swift
//  GuessNumber_Test
//
//  Created by Georgiy Groshev on 07.12.2022.
//

import Foundation

struct GameModel: Codable {
    
    var hiddenNumber: Int = 0
    
    public class State: Codable {
        var numberOfTries: Int = 0
        var difficultLevel: DifficultLevel = .easy
    }
    public var state = State()
    
    public func increaseNumberOfTries() {
        self.state.numberOfTries += 1
    }
}
enum DifficultLevel: Int, Codable {
    case easy = 10
    case medium = 25
    case hard = 50
}

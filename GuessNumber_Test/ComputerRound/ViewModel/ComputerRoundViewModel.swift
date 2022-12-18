//
//  ComputerRoundViewModel.swift
//  GuessNumber_Test
//
//  Created by Georgiy Groshev on 09.12.2022.
//

import Foundation

protocol ComputerRoundViewModelProtocol: AnyObject {
    
    var computerVariant: Dynamic<Int> { get }
    
    func increaseVariantNumber(completion: @escaping (String) -> Void)
    func reduceVariantNumber(completion: @escaping (String) -> Void)
    func saveNumberOfTries()
}

class ComputerRoundViewModel: ComputerRoundViewModelProtocol {
    
    var computerVariant: Dynamic<Int>
    
    private var playersHiddenNumber: Int
    private var computerRound: GameModel
    private var gameSystem = GameSystem()
    private let maximumNumber: Int
    
    init(hiddenNumber: Int) {
        
        maximumNumber = try! gameSystem.load(R.UserDefaultsKeys.maximumNumber).state.difficultLevel.rawValue
        
        self.computerVariant = Dynamic((Int.random(in: 1...maximumNumber)))
        self.playersHiddenNumber = hiddenNumber
        self.computerRound = GameModel(hiddenNumber: hiddenNumber)
    }
    func increaseVariantNumber(completion: @escaping (String) -> Void) {
        
        guard computerVariant.value != playersHiddenNumber,
              computerVariant.value > playersHiddenNumber else {
            
            completion(protectionAgainstLiars())
            return
        }
        self.computerRound.increaseNumberOfTries()
        self.computerVariant.value = Int.random(in: 1...(self.computerVariant.value - 1))
    }
    func reduceVariantNumber(completion: @escaping (String) -> Void) {
        
        guard computerVariant.value != playersHiddenNumber,
              computerVariant.value < playersHiddenNumber else {
            
            completion(protectionAgainstLiars())
            return
        }
        
        self.computerRound.increaseNumberOfTries()
        self.computerVariant.value = Int.random(in: (self.computerVariant.value + 1)...self.maximumNumber)
    }
    func saveNumberOfTries() {
        try? gameSystem.save(computerRound, title: R.UserDefaultsKeys.computerRound)
    }
    private func protectionAgainstLiars() -> String {
        return R.Strings.ComputerRound.protectionAgainstLiar
    }
}

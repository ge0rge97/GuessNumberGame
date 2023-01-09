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
    
    private var computerRound: GameModel
    private var gameSystem = GameSystem()
    private var maximumNumber: Int
    private var minNumber = 1
    
    init(hiddenNumber: Int) {
        
        maximumNumber = try! gameSystem.load(R.UserDefaultsKeys.maximumNumber).state.difficultLevel.rawValue
        computerVariant = Dynamic((Int.random(in: 1...maximumNumber)))
        computerRound = GameModel(hiddenNumber: hiddenNumber)
    }
    func increaseVariantNumber(completion: @escaping (String) -> Void) {
        guard computerVariant.value != computerRound.hiddenNumber,
              computerVariant.value > computerRound.hiddenNumber else {
            
            completion(protectionAgainstLiars())
            return
        }
        computerVariant.value = newComputerTry(computerVariants: .increase,
                                               currentValue: self.computerVariant.value)
    }
    func reduceVariantNumber(completion: @escaping (String) -> Void) {
        guard computerVariant.value != computerRound.hiddenNumber,
              computerVariant.value < computerRound.hiddenNumber else {
            
            completion(protectionAgainstLiars())
            return
        }
        computerVariant.value = newComputerTry(computerVariants: .reduce,
                                               currentValue: self.computerVariant.value)
    }
    func saveNumberOfTries() {
        try? gameSystem.save(computerRound, title: R.UserDefaultsKeys.computerRound)
    }
}
//MARK: - Private Methods
extension ComputerRoundViewModel {
    
    private enum ComputerVariants {
        case increase
        case reduce
    }
    
    private func newComputerTry(computerVariants: ComputerVariants, currentValue: Int) -> Int {
        
        var numberOfOptions = Array(minNumber...maximumNumber)
        
        switch computerVariants {
        case .increase:
            maximumNumber = currentValue - 1
            numberOfOptions = numberOfOptions.filter{ $0 < currentValue }
        case .reduce:
            minNumber = currentValue + 1
            numberOfOptions = numberOfOptions.filter{ $0 > currentValue }
        }
        
        self.computerRound.increaseNumberOfTries()
        return numberOfOptions.randomElement() ?? 1
    }
    private func protectionAgainstLiars() -> String {
        return R.Strings.ComputerRound.protectionAgainstLiar
    }
}

//
//  PlayerRoundViewModel.swift
//  GuessNumber_Test
//
//  Created by Georgiy Groshev on 09.12.2022.
//

import Foundation

protocol PlayerRoundViewModelProtocol: AnyObject {
    
    var computerAnswer: Dynamic<String> { get }
    
    func playersTry(withNumber number: Int, completion: @escaping () -> Void)
    func saveNumberOfTries()
    func getMaximumNumber() -> Int
}
 
class PlayerRoundViewModel: PlayerRoundViewModelProtocol {
    
    var computerAnswer: Dynamic<String> = Dynamic("")
    var playerRound: GameModel
    
    private let gameSystem = GameSystem()
    private var computerHiddenNumber: Int
    
    init() {
        
        let maximumNumber: Int = try! gameSystem.load(R.UserDefaultsKeys.maximumNumber).state.difficultLevel.rawValue
        
        self.computerHiddenNumber = Int.random(in: 1...maximumNumber)
        self.playerRound = GameModel(hiddenNumber: computerHiddenNumber)
    }
    func playersTry(withNumber number: Int, completion: @escaping () -> Void) {
        
        if number == playerRound.hiddenNumber {
            completion()
            saveNumberOfTries()
            computerAnswer.value = R.Strings.PlayerRound.correctAnswer
        } else {
            if number > computerHiddenNumber {
                computerAnswer.value = R.Strings.PlayerRound.tooMuchAnswer
            } else {
                computerAnswer.value = R.Strings.PlayerRound.tooLessAnswer
            }
            playerRound.increaseNumberOfTries()
        }
    }
    func saveNumberOfTries() {
        try? gameSystem.save(playerRound, title: R.UserDefaultsKeys.playerRound)
    }
    func getMaximumNumber() -> Int {
        return try! gameSystem.load(R.UserDefaultsKeys.maximumNumber).state.difficultLevel.rawValue
    }
}

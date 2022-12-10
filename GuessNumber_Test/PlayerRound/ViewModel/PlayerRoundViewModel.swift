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
}
 
class PlayerRoundViewModel: PlayerRoundViewModelProtocol {
    
    var computerAnswer: Dynamic<String> = Dynamic("")
    
    private var playerRound: GameModel
    
    private var computerHiddenNumber: Int
    
    private let userDefaults = UserDefaults.standard
    
    init() {
        
        self.computerHiddenNumber = Int.random(in: 1...5)
        
        self.playerRound = GameModel(hiddenNumber: computerHiddenNumber)
    }
    
    func playersTry(withNumber number: Int, completion: @escaping () -> Void) {
        
        if number == playerRound.hiddenNumber {
            
            completion()
            
            saveNumberOfTries()
            
            computerAnswer.value = R.Strings.PlayerRound.correctAnswer
            
        } else {
            
            playerRound.increaseNumberOfTries()
            
            computerAnswer.value =  R.Strings.PlayerRound.wrongAnswer
        }
    }
    
    func saveNumberOfTries() {
        
        userDefaults.set(playerRound.numberOfTries, forKey: R.UserDefaultsKeys.playerRound)
    }
}

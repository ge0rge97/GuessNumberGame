//
//  Resources.swift
//  GuessNumber_Test
//
//  Created by Georgiy Groshev on 10.12.2022.
//

import UIKit

typealias R = Resources

enum Resources {
    //MARK: - UserDefaults Keys
    enum UserDefaultsKeys {
        static let computerRound = "computerRound"
        static let playerRound = "playerRound"
        static let maximumNumber = "difficultLevel"
    }
}
//MARK: - Strings
extension Resources {
    
    enum Strings {
        
        enum Alert {
            static let alertTitle = "Attention!"
            static let alertMessage = "Enter here your number."
        }
        
        enum  StartScreen {
            static let startButton = "Let's start"
            static let navigationTitle = "Guess the Number Game"
        }
        
        enum DifficultyLevel {
            static let navigationTitle = "Select Difficulty Level"
            static let easyButton = "Easy Level: 1-10"
            static let mediumButton = "Medium Level: 1-25"
            static let hardButton = "Hard Level: 1-50"
        }
        
        enum EnterNumberScreen {
            static let enterNumberButton = "Enter your Number"
            static let navigationTitle = "Enter your Number"
        }
        
        enum ComputerRound {
            static let navigationTitle = "Computer Turn"
            static let protectionAgainstLiar = "Sorry but you are LIAR!"
        }
        
        enum PlayerRound {
            static let choiceButton = "Let's try"
            static let navigationTitle = "Player Turn"
            
            static let correctAnswer = "Correct"
            static let tooMuchAnswer = "Too much"
            static let tooLessAnswer = "Too less"
        }
        
        enum ResultScreen {
            static let restartButton = "Restart?"
            static let navigationTitle = "Result"
        }
    }
}

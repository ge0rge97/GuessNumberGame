//
//  DifficultyLevelViewModel.swift
//  GuessNumber_Test
//
//  Created by Georgiy Groshev on 11.12.2022.
//

import Foundation

protocol DifficultyLevelViewModelProtocol {

    func easyLevelSelected()
    
    func mediumLevelSelected()
    
    func hardLevelSelected()
}

class DifficultyLevelViewModel: DifficultyLevelViewModelProtocol {
    
    private var difficultLevel: DifficultLevel?
    
    private var userDefaults = UserDefaults.standard
    
    func easyLevelSelected() {
        
        self.difficultLevel = .easy
        
        setDifficultLevel()
    }
    
    func mediumLevelSelected() {
        
        self.difficultLevel = .medium
        
        setDifficultLevel()
    }
    
    func hardLevelSelected() {
        
        self.difficultLevel = .hard
        
        setDifficultLevel()
    }
    
    private func setDifficultLevel() {
        
        self.userDefaults.set(self.difficultLevel?.rawValue,
                              forKey: R.UserDefaultsKeys.maximumNumber)
    }
}

private extension DifficultyLevelViewModel {
    
    enum DifficultLevel: Int, CaseIterable {
        
        case easy = 10
        case medium = 25
        case hard = 50
    }
}

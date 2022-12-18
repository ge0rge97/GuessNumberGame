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
    
    private var gameSystem = GameSystem()
    private var gameModel = GameModel()
    
    func easyLevelSelected() {
        gameModel.state.difficultLevel = .easy
        setDifficultLevel()
    }
    func mediumLevelSelected() {
        gameModel.state.difficultLevel = .medium
        setDifficultLevel()
    }
    func hardLevelSelected() {
        gameModel.state.difficultLevel = .hard
        setDifficultLevel()
    }
    private func setDifficultLevel() {
        try? self.gameSystem.save(gameModel, title: R.UserDefaultsKeys.maximumNumber)
    }
}

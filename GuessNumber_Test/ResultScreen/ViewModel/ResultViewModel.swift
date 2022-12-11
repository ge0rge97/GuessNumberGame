//
//  ResultViewModel.swift
//  GuessNumber_Test
//
//  Created by Georgiy Groshev on 09.12.2022.
//

import Foundation

protocol ResultViewModelProtocol: AnyObject {
    
    func getGameResult() -> String
}

class ResultViewModel: ResultViewModelProtocol {
    
    private let userDefaults = UserDefaults.standard
    
    private var resultsModel: ResultsModels
    
    init() {
        
        resultsModel = ResultsModels(results: .draw)
    }
    
    func getGameResult() -> String {
        
        if resultsModel.numberOfPlayersTries > resultsModel.numberOfComputerTries {
            
            self.resultsModel.results = .computerWin
            return resultsModel.results.title
            
        } else if resultsModel.numberOfComputerTries > resultsModel.numberOfPlayersTries {
            
            self.resultsModel.results = .playerWin
            return resultsModel.results.title
            
        } else {
            
            self.resultsModel.results = .draw
            return resultsModel.results.title
        }
    }
}

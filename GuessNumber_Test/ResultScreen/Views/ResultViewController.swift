//
//  ResultViewController.swift
//  GuessNumber_Test
//
//  Created by Georgiy Groshev on 06.12.2022.
//

import UIKit

final class ResultViewController: BaseViewController<ResultRootView> {
    
    private var resultViewModel: ResultViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.resultViewModel = ResultViewModel()
        
        setupNavigationItem()
        setupButtonAction()
        
        self.mainView.resultLabel.text = resultViewModel?.getGameResult()
    }
}
//MARK: - Required Methods
private extension ResultViewController {
    
    func setupNavigationItem() {
        
        self.navigationItem.title = R.Strings.ResultScreen.navigationTitle
    }
    
    func setupButtonAction() {
        
        mainView.restartButton.addTarget(self, action: #selector(restartButtonAction), for: .touchUpInside)
    }
}
//MARK: - Action
@objc
private extension ResultViewController {
    
    func restartButtonAction() {
        
        let enterViewController = StartViewController()
        
        self.transitionWithNavigationController(transitionTo: enterViewController)
    }
}

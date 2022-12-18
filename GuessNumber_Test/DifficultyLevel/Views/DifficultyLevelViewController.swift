//
//  DifficultyLevelViewController.swift
//  GuessNumber_Test
//
//  Created by Georgiy Groshev on 11.12.2022.
//

import UIKit

final class DifficultyLevelViewController: BaseViewController<DifficultyLevelRootView> {
    
    private var difficultyLevelViewModel: DifficultyLevelViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.difficultyLevelViewModel = DifficultyLevelViewModel()
        setupNavigationItem()
        setupButtonAction()
    }
}
//MARK: - Private Methods
private extension DifficultyLevelViewController {
    
    func setupNavigationItem() {
        self.navigationItem.title = R.Strings.DifficultyLevel.navigationTitle
    }
    func setupButtonAction() {
        self.mainView.easyLevelButton.addTarget(self, action: #selector(easyLevelButtonAction), for: .touchUpInside)
        self.mainView.mediumLevelButton.addTarget(self, action: #selector(mediumLevelButtonAction), for: .touchUpInside)
        self.mainView.hardLevelButton.addTarget(self, action: #selector(hardLevelButtonAction), for: .touchUpInside)
    }
    func transitionToEnterNumberScreen() {
        
        let enterNumberViewController = EnterNumberScreenViewController()
        self.transitionWithNavigationController(transitionTo: enterNumberViewController)
    }
}
//MARK: - Actions
@objc
private extension DifficultyLevelViewController {
    
    func easyLevelButtonAction() {
        self.difficultyLevelViewModel?.easyLevelSelected()
        self.transitionToEnterNumberScreen()
    }
    func mediumLevelButtonAction() {
        self.difficultyLevelViewModel?.mediumLevelSelected()
        self.transitionToEnterNumberScreen()
    }
    func hardLevelButtonAction() {
        self.difficultyLevelViewModel?.hardLevelSelected()
        self.transitionToEnterNumberScreen()
    }
}

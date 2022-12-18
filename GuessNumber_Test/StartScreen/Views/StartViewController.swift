//
//  StartViewController.swift
//  GuessNumber_Test
//
//  Created by Georgiy Groshev on 06.12.2022.
//

import UIKit

final class StartViewController: BaseViewController<StartRootView> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationTitle()
        setupButtonAction()
    }
}
//MARK: - Private Methods
private extension StartViewController {
    
    func setupNavigationTitle() {
        self.navigationItem.title = R.Strings.StartScreen.navigationTitle
    }
    func setupButtonAction() {
        mainView.startButton.addTarget(self, action: #selector(startButtonAction), for: .touchUpInside)
    }
}
//MARK: - Actions
@objc
private extension StartViewController {

    func startButtonAction() {
        
        let vc = DifficultyLevelViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

//
//  StartViewController.swift
//  GuessNumber_Test
//
//  Created by Georgiy Groshev on 06.12.2022.
//

import UIKit

final class StartViewController: BaseViewController<StartRootView> {
    
    private var restartGameViewModel: RestartGameViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationTitle()
        setupButtonAction()
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        self.restartGameViewModel = RestartGameViewModel()
        
        self.restartGameViewModel?.restartGame()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        
        let vc = EnterNumberScreenViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

//
//  PlayerRoundViewController.swift
//  GuessNumber_Test
//
//  Created by Georgiy Groshev on 06.12.2022.
//

import UIKit

final class PlayerRoundViewController: BaseViewController<PlayerRoundRootView> {
    
    private var playerRoundViewModel: PlayerRoundViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.playerRoundViewModel = PlayerRoundViewModel()
        
        setupNavigationTitle()
        setupButtonAction()
        
        bindViewModel()
    }
}
//MARK: - Private Methods
private extension PlayerRoundViewController {
    
    func setupNavigationTitle() {
        
        self.navigationItem.title = R.Strings.PlayerRound.navigationTitle
    }
    
    func setupButtonAction() {
        
        mainView.choiceButton.addTarget(self, action: #selector(choiceButtonAction), for: .touchUpInside)
    }
    
    func bindViewModel() {
        
        playerRoundViewModel?.computerAnswer.bind({ (answer) in
            
            DispatchQueue.main.async {
                self.mainView.answerLabel.text = answer
            }
        })
    }
}
//MARK: - Actions
@objc
private extension PlayerRoundViewController {
    
    func choiceButtonAction() {
        
        self.getAlertWithCompletion(withTitle: R.Strings.Alert.alertTitle,
                                    andMessage: R.Strings.Alert.alertMessage) {
            (number) in
            
            self.playerRoundViewModel?.playersTry(withNumber: number, completion: {
                
                let resultViewController = ResultViewController()
                
                self.transitionWithNavigationController(transitionTo: resultViewController)
            })
        }
    }
}

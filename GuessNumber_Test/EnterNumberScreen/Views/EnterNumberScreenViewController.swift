//
//  EnterNumberScreenViewController.swift
//  GuessNumber_Test
//
//  Created by Georgiy Groshev on 06.12.2022.
//

import UIKit

final class EnterNumberScreenViewController: BaseViewController<EnterNumberScreenRootView> {
    
    private let userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        enterNumberButtonAction()
        setupNavigationTitle()
    }
}
//MARK: - Private Methods
private extension EnterNumberScreenViewController {
    
    func setupNavigationTitle() {
        
        self.navigationItem.title = R.Strings.EnterNumberScreen.enterNumberButton
    }
    
    func enterNumberButtonAction() {
        
        mainView.enterNumberButton.addTarget(self,
                                             action: #selector(enterButtonAction),
                                             for: .touchUpInside)
    }
}
//MARK: - Actions
@objc
extension EnterNumberScreenViewController {
    
    func enterButtonAction() {
        
        self.getAlertWithCompletion(withTitle: R.Strings.Alert.alertTitle,
                                    andMessage: R.Strings.Alert.alertMessage) { [weak self]
            (number) in
            
            guard number <= self?.userDefaults.integer(forKey: R.UserDefaultsKeys.maximumNumber) ?? 1 else {
                
                self?.createAlert(withTitle: "You number haven't been more than \(self?.userDefaults.integer(forKey: R.UserDefaultsKeys.maximumNumber) ?? 1)")
                return
            }
            
            let computerRoundViewController = ComputerRoundViewController(withHiddenNumber: number)
            
            self?.transitionWithNavigationController(transitionTo: computerRoundViewController)
        }
    }
}

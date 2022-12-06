//
//  EnterNumberScreenViewController.swift
//  GuessNumber_Test
//
//  Created by Georgiy Groshev on 06.12.2022.
//

import UIKit

final class EnterNumberScreenViewController: BaseViewController<EnterNumberScreenRootView> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        enterNumberButtonAction()
        setupNavigationTitle()
    }
}
//MARK: - Private Methods
private extension EnterNumberScreenViewController {
    
    func setupNavigationTitle() {
        
        self.navigationItem.title = "Enter your Number"
    }
    
    func enterNumberButtonAction() {
        
        mainView.enterNumberButton.addTarget(self, action: #selector(enterButtonAction), for: .touchUpInside)
    }
    
}
//MARK: - Actions
@objc
private extension EnterNumberScreenViewController {
    
    func enterButtonAction() {
        print(#function)
        
        let alert = UIAlertController(title: "Title", message: "Message", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Enter", style: .default, handler: { _ in
            
            guard let text = alert.textFields?[0].text else { return }
            
            print(text)
        }))
        
        alert.addTextField()
        present(alert, animated: true)
    }
}

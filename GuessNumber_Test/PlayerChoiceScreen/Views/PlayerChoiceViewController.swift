//
//  PlayerChoiceViewController.swift
//  GuessNumber_Test
//
//  Created by Georgiy Groshev on 06.12.2022.
//

import UIKit

final class PlayerChoiceViewController: BaseViewController<PlayerChoiceRootView> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationTitle()
        setupButtonAction()
    }
}
//MARK: - Private Methods
private extension PlayerChoiceViewController {
    
    func setupNavigationTitle() {
        
        self.navigationItem.title = "Player Turn"
    }
    
    func setupButtonAction() {
        
        mainView.choiceButton.addTarget(self, action: #selector(choiceButtonAction), for: .touchUpInside)
    }
}
//MARK: - Actions
@objc
private extension PlayerChoiceViewController {
    
    func choiceButtonAction() {
        
        print(#function)
        
        let alert = UIAlertController(title: "Title", message: "Message", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Enter", style: .default, handler: { _ in
            
            guard let text = alert.textFields?[0].text else { return }
            
            self.mainView.answerLabel.text = text
        }))
        
        alert.addTextField()
        present(alert, animated: true)
    }
}

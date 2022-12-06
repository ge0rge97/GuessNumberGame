//
//  ComputerChoiceViewController.swift
//  GuessNumber_Test
//
//  Created by Georgiy Groshev on 06.12.2022.
//

import UIKit

enum Answers: String, CaseIterable {
    
    case correct = "="
    case more = ">"
    case less = "<"
}

final class ComputerChoiceViewController: BaseViewController<ComputerChoiceRootView> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationItem()
        setupButtonActions()
    }
}
//MARK: - Private Methods
private
extension ComputerChoiceViewController {
    
    func setupNavigationItem() {
        
        self.navigationItem.title = "Computer Turn"
    }
    
    func setupButtonActions() {
        
        mainView.moreButtonAnswer.addTarget(self, action: #selector(moreButtonAction), for: .touchUpInside)
        mainView.lessButtonAnswer.addTarget(self, action: #selector(lessButtonAction), for: .touchUpInside)
        mainView.correctButtonAnswer.addTarget(self, action: #selector(correctButtonAction), for: .touchUpInside)
    }
}
//MARK: - Actions
@objc
extension ComputerChoiceViewController {
    
    func moreButtonAction() {
        print(#function)
    }
    
    func lessButtonAction() {
        print(#function)
    }
    
    func correctButtonAction() {
        print(#function)
    }
}

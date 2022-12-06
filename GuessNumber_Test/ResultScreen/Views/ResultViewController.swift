//
//  ResultViewController.swift
//  GuessNumber_Test
//
//  Created by Georgiy Groshev on 06.12.2022.
//

import UIKit

final class ResultViewController: BaseViewController<ResultRootView> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationItem()
        setupButtonAction()
    }
}
//MARK: - Required Methods
private extension ResultViewController {
    
    func setupNavigationItem() {
        
        self.navigationItem.title = "Result"
    }
    
    func setupButtonAction() {
        
        mainView.restartButton.addTarget(self, action: #selector(restartButtonAction), for: .touchUpInside)
    }
}
//MARK: - Action
@objc
private extension ResultViewController {
    
    func restartButtonAction() {
        
        print(#function)
    }
}

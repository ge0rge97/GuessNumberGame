//
//  ComputerRoundViewController.swift
//  GuessNumber_Test
//
//  Created by Georgiy Groshev on 06.12.2022.
//

import UIKit

final class ComputerRoundViewController: BaseViewController<ComputerRoundRootView> {
    
    private var computerRoundViewModel: ComputerRoundViewModelProtocol?
    
    init(withHiddenNumber number: Int) {
        super.init(nibName: nil, bundle: nil)
        
        self.computerRoundViewModel = ComputerRoundViewModel(hiddenNumber: number)
        
        setupNavigationItem()
        setupButtonActions()
        bindViewModel()
        
        mainView.computerChoiceLabel.text = String(self.computerRoundViewModel?.computerVariant.value ?? 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
//MARK: - Private Methods
private
extension ComputerRoundViewController {
    
    func setupNavigationItem() {
        
        self.navigationItem.title = R.Strings.ComputerRound.navigationTitle
    }
    
    func setupButtonActions() {
        
        mainView.moreButtonAnswer.addTarget(self, action: #selector(moreButtonAction), for: .touchUpInside)
        mainView.lessButtonAnswer.addTarget(self, action: #selector(lessButtonAction), for: .touchUpInside)
        mainView.correctButtonAnswer.addTarget(self, action: #selector(correctButtonAction), for: .touchUpInside)
    }
    
    func bindViewModel() {
        
        self.computerRoundViewModel?.computerVariant.bind({ [weak self] (computerVariant) in
            
            DispatchQueue.main.async {
                self?.mainView.computerChoiceLabel.text = String(computerVariant)
            }
        })
    }
}
//MARK: - Actions
@objc
extension ComputerRoundViewController {
    
    func moreButtonAction() {
    
        self.computerRoundViewModel?.reduceVariantNumber(completion: { [weak self] error in
            
            self?.createAlert(withTitle: error)
        })
    }
    
    func lessButtonAction() {
        
        self.computerRoundViewModel?.increaseVariantNumber(completion: { [weak self] error in
            
            self?.createAlert(withTitle: error)
        })
    }
    
    func correctButtonAction() {
        
        self.computerRoundViewModel?.saveNumberOfTries()
        
        let playerRoundViewController = PlayerRoundViewController()
        
        self.transitionWithNavigationController(transitionTo: playerRoundViewController)
    }
}

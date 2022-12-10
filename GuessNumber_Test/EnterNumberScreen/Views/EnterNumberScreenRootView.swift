//
//  EnterNumberScreenRootView.swift
//  GuessNumber_Test
//
//  Created by Georgiy Groshev on 06.12.2022.
//

import UIKit

final class EnterNumberScreenRootView: BaseView {
    
    let enterNumberButton = BaseButton(withTitle: R.Strings.EnterNumberScreen.enterNumberButton)
    
    //MARK: - Constraints
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            
            enterNumberButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: Constants.buttonHeight),
            enterNumberButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            enterNumberButton.heightAnchor.constraint(equalToConstant: Constants.buttonHeight),
            enterNumberButton.widthAnchor.constraint(equalToConstant: self.bounds.width - (Constants.buttonHeight * 2))
        ])
    }
}
//MARK: - Required Methods
extension EnterNumberScreenRootView {
    
    override func setupViews() {
        [enterNumberButton].forEach{ addSubview($0) }
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
        [enterNumberButton].forEach{ $0.translatesAutoresizingMaskIntoConstraints = false }
    }
}
//MARK: - Constants
private extension EnterNumberScreenRootView {
    
    enum Constants {
        
        static let buttonHeight: CGFloat = 70
    }
}

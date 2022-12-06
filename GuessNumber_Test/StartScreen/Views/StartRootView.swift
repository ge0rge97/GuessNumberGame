//
//  StartRootView.swift
//  GuessNumber_Test
//
//  Created by Georgiy Groshev on 06.12.2022.
//

import UIKit

final class StartRootView: BaseView {
    
    let startButton = BaseButton(withTitle: "Let's start")
    
    //MARK: - Constraints
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            
            startButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: Constants.buttonHeight),
            startButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            startButton.heightAnchor.constraint(equalToConstant: Constants.buttonHeight),
            startButton.widthAnchor.constraint(equalToConstant: self.bounds.width - (Constants.buttonHeight * 2))
        ])
    }
}
//MARK: - Required Methods
extension StartRootView {
    
    override func setupViews() {
        
        [startButton].forEach{ addSubview($0) }
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
        [startButton].forEach{ $0.translatesAutoresizingMaskIntoConstraints = false }
    }
}
//MARK: - Constants
private extension StartRootView {
    
    enum Constants {
        
        static let buttonHeight: CGFloat = 70
    }
}

//
//  PlayerRoundRootView.swift
//  GuessNumber_Test
//
//  Created by Georgiy Groshev on 06.12.2022.
//

import UIKit

final class PlayerRoundRootView: BaseView {
    
    let choiceButton = BaseButton(withTitle: R.Strings.PlayerRound.choiceButton)
    let answerLabel = UILabel()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        NSLayoutConstraint.activate([
            answerLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -Constants.buttonHeight),
            answerLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
        
            choiceButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: Constants.buttonHeight),
            choiceButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            choiceButton.heightAnchor.constraint(equalToConstant: Constants.buttonHeight),
            choiceButton.widthAnchor.constraint(equalToConstant: self.bounds.width - (Constants.buttonHeight * 2))
        ])
    }
}
//MARK: - Required Methods
extension PlayerRoundRootView {
    
    override func setupViews() {
        [choiceButton, answerLabel].forEach{ addSubview($0) }
    }
    override func configureAppearance() {
        super.configureAppearance()
        [choiceButton, answerLabel].forEach{ $0.translatesAutoresizingMaskIntoConstraints = false }
        
        answerLabel.font = .systemFont(ofSize: 20)
        answerLabel.textAlignment = .center
    }
}
//MARK: - Constants
private extension PlayerRoundRootView {
    
    enum Constants {
        static let buttonHeight: CGFloat = 70
    }
}

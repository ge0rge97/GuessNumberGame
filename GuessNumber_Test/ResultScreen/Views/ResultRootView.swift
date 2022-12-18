//
//  ResultRootView.swift
//  GuessNumber_Test
//
//  Created by Georgiy Groshev on 06.12.2022.
//

import UIKit

final class ResultRootView: BaseView {
    
    let restartButton = BaseButton(withTitle: R.Strings.ResultScreen.restartButton)
    let resultLabel = UILabel()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        NSLayoutConstraint.activate([
            resultLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -Constants.buttonHeight),
            resultLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
        
            restartButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: Constants.buttonHeight),
            restartButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            restartButton.heightAnchor.constraint(equalToConstant: Constants.buttonHeight),
            restartButton.widthAnchor.constraint(equalToConstant: self.bounds.width - (Constants.buttonHeight * 2))
        ])
    }
}
//MARK: - Required Methods
extension ResultRootView {
    
    override func setupViews() {
        [resultLabel, restartButton].forEach{ addSubview($0) }
    }
    override func configureAppearance() {
        super.configureAppearance()
        [resultLabel, restartButton].forEach{ $0.translatesAutoresizingMaskIntoConstraints = false }
        
        resultLabel.font = .systemFont(ofSize: 20)
        resultLabel.textAlignment = .center
    }
}
//MARK: - Constants
private extension ResultRootView {
    
    enum Constants {
        static let buttonHeight: CGFloat = 70
    }
}

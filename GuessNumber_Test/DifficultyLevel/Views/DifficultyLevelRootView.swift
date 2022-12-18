//
//  DifficultyLevelRootView.swift
//  GuessNumber_Test
//
//  Created by Georgiy Groshev on 11.12.2022.
//

import UIKit

final class DifficultyLevelRootView: BaseView {
    
    let easyLevelButton = BaseButton(withTitle: R.Strings.DifficultyLevel.easyButton)
    let mediumLevelButton = BaseButton(withTitle: R.Strings.DifficultyLevel.mediumButton)
    let hardLevelButton = BaseButton(withTitle: R.Strings.DifficultyLevel.hardButton)
    
    private let stackView = UIStackView()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        NSLayoutConstraint.activate([
        
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.heightAnchor.constraint(equalToConstant: self.bounds.height / 3),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.mainSpacing),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.mainSpacing),
        ])
    }
}
//MARK: - Required Methods
extension DifficultyLevelRootView {
    
    override func setupViews() {
        [easyLevelButton, mediumLevelButton, hardLevelButton].forEach{ stackView.addArrangedSubview($0) }
        [stackView].forEach{ addSubview($0) }
    }
    override func configureAppearance() {
        super.configureAppearance()
        [stackView].forEach{ $0.translatesAutoresizingMaskIntoConstraints = false }
        
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = Constants.stakViewSpacing
    }
}
//MARK: - Constants
private extension DifficultyLevelRootView {
    
    enum Constants {
        static let mainSpacing: CGFloat = 30
        static let stakViewSpacing: CGFloat = 20
    }
}

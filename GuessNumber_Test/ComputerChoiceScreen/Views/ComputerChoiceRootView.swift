//
//  ComputerChoiceRootView.swift
//  GuessNumber_Test
//
//  Created by Georgiy Groshev on 06.12.2022.
//

import UIKit

final class ComputerChoiceRootView: BaseView {
    
    let computerChoiceLabel = UILabel()
    
    let moreButtonAnswer = ComputerChoiceRootView.createAnswerButton(withTitle: .more)
    let lessButtonAnswer = ComputerChoiceRootView.createAnswerButton(withTitle: .less)
    let correctButtonAnswer = ComputerChoiceRootView.createAnswerButton(withTitle: .correct)
    
    private let stackView = UIStackView()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
        
            computerChoiceLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -Constants.labelSpacing),
            computerChoiceLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: Constants.labelSpacing),
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.heightAnchor.constraint(equalToConstant: Constants.labelSpacing),
            stackView.widthAnchor.constraint(equalToConstant: self.bounds.width - Constants.labelSpacing )
        ])
    }
}
//MARK: - Required Methods
extension ComputerChoiceRootView {
    
    override func setupViews() {
        
        [lessButtonAnswer, correctButtonAnswer, moreButtonAnswer]
            .forEach{ stackView.addArrangedSubview($0) }
        
        [computerChoiceLabel, stackView]
            .forEach{ addSubview($0) }
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
        [computerChoiceLabel, stackView]
            .forEach{ $0.translatesAutoresizingMaskIntoConstraints = false }
        
        computerChoiceLabel.text = "Test Answer"
        computerChoiceLabel.font = .systemFont(ofSize: 20)
        computerChoiceLabel.textAlignment = .center
        
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 10
    }
}
//MARK: - Create Answer Button
private extension ComputerChoiceRootView {
    
    static func createAnswerButton(
            withTitle title: Answers)
    -> UIButton {
        
        let button = UIButton(type: .system)
        
        button.setTitle(title.rawValue, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 4
        button.backgroundColor = UIColor(hexString: "2A5954")
        
        return button
    }
}
//MARK: - Constants
private extension ComputerChoiceRootView {
    
    enum Constants {
        
        static let labelSpacing: CGFloat = 70
        
        static let buttonHeight: CGFloat = 35
    }
}

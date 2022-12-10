//
//  ComputerChoiceRootView.swift
//  GuessNumber_Test
//
//  Created by Georgiy Groshev on 06.12.2022.
//

import UIKit

final class ComputerRoundRootView: BaseView {
    
    let computerChoiceLabel = UILabel()
    
    let moreButtonAnswer = ComputerRoundRootView.createAnswerButton(withTitle: .more)
    let lessButtonAnswer = ComputerRoundRootView.createAnswerButton(withTitle: .less)
    let correctButtonAnswer = ComputerRoundRootView.createAnswerButton(withTitle: .correct)
    
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
extension ComputerRoundRootView {
    
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
        
        computerChoiceLabel.font = .systemFont(ofSize: 20)
        computerChoiceLabel.textAlignment = .center
        
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 10
    }
}
//MARK: - Create Answer Button
private extension ComputerRoundRootView {
    
    static func createAnswerButton(
        withTitle title: Answers)
    -> UIButton {
        
        let button = UIButton(type: .system)
        
        button.setTitle(title.title, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 4
        button.backgroundColor = UIColor(hexString: "2A5954")
        
        return button
    }
}
//MARK: - Answers
private extension ComputerRoundRootView {
    
    enum Answers: String {
        
        case correct
        case more
        case less
        
        var title: String {
            switch self {
            case .correct:
                return "="
            case .more:
                return ">"
            case .less:
                return "<"
            }
        }
    }
}
//MARK: - Constants
private extension ComputerRoundRootView {
    
    enum Constants {
        
        static let labelSpacing: CGFloat = 70
        
        static let buttonHeight: CGFloat = 35
    }
}

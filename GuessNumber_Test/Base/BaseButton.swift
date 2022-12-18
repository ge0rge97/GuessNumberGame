//
//  BaseButton.swift
//  GuessNumber_Test
//
//  Created by Georgiy Groshev on 06.12.2022.
//

import UIKit

final class BaseButton: UIButton {
    
    private var buttonTitle: String?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    convenience init(withTitle title: String) {
        self.init(type: .system)
        
        self.buttonTitle = title
        setupButton()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
//MARK: - Setup Button
extension BaseButton {
    
    private func setupButton() {
        self.setTitleColor(.white, for: .normal)
        self.setTitle(buttonTitle, for: .normal)
        self.backgroundColor = UIColor(hexString: "2A3954")
        self.layer.cornerRadius = 10
        self.titleLabel?.font = .systemFont(ofSize: 24)
        //MARK: - Button Shadow
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
        self.layer.masksToBounds = false
    }
}

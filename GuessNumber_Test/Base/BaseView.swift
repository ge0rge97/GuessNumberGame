//
//  BaseView.swift
//  GuessNumber_Test
//
//  Created by Georgiy Groshev on 06.12.2022.
//

import UIKit

class BaseView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        configureAppearance()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
//MARK: - Inherited Methods
extension BaseView {
    @objc func setupViews() {}
    @objc func configureAppearance() {
        self.backgroundColor = .white
    }
}

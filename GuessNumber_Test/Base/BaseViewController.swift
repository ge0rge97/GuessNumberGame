//
//  BaseViewController.swift
//  GuessNumber_Test
//
//  Created by Georgiy Groshev on 06.12.2022.
//

import UIKit

class BaseViewController<View: UIView>: UIViewController {
    
    var mainView: View { view as! View }
    
    override func loadView() {
        view = View()
    }
}

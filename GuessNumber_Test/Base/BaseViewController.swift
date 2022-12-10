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

//MARK: - Transition Method 
extension BaseViewController {
    
    func transitionWithNavigationController(transitionTo viewController: UIViewController) {
        
        let viewController = viewController
        
        let navVC = UINavigationController(rootViewController: viewController)
        navVC.modalPresentationStyle = .fullScreen
        self.present(navVC, animated: true)
    }
}
//MARK: - Add Alert Method
extension BaseViewController {
    
    func getAlertWithCompletion(withTitle title: String?,
                                andMessage message: String?,
                                completion: @escaping (Int) -> ()) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            
            guard let text = alert.textFields?[0].text,
                    let number = Int(text) else { return }
            
            (completion)(number)
        }))
        
        alert.addTextField()
        present(alert, animated: true)
    }
}

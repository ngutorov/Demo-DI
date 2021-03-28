//
//  UIViewController+ShowAlert.swift
//  Demo-DI
//
//  Created by Nikolay Gutorov on 4/2/21.
//

import UIKit

extension UIViewController {
    
    func showAlert(with title: String, message: String) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(alertAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
}

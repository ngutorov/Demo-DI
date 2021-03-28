//
//  UIViewController+DismissKeyboard.swift
//  Demo-DI
//
//  Created by Nikolay Gutorov on 4/2/21.
//

import UIKit

extension UIViewController {
    
    func addDismissKeyboardTouch() {
        let dismissTap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        //dismissTap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(dismissTap)
    }
}

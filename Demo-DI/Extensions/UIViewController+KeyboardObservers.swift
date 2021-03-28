//
//  UIViewController+KeyboardObservers.swift
//  Demo-DI
//
//  Created by Nikolay Gutorov on 4/3/21.
//

import UIKit

extension UIViewController {
    
    var shouldResizeForKeyboard: Bool? {
        // If set true, must set false in deinit()
        set(newValue) {
            if newValue == true {
                addKeyboardObservers()
            } else {
                removeKeyboardObservers()
            }
        }
        get {
            // Always returns nil by design!
            return nil
        }
    }
    
    private func addKeyboardObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func removeKeyboardObservers() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            // If keyboard size is not available for some reason, don't do anything.
            return
        }
        self.view.frame.size.height -= keyboardSize.height
    }
    
    @objc private func keyboardWillHide(notification: NSNotification) {
        self.view.frame.size.height = UIScreen.main.bounds.height
    }
}

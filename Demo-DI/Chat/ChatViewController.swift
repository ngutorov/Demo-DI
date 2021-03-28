//
//  ViewController.swift
//  Demo-DI
//
//  Created by Nikolay Gutorov on 3/28/21.
//

import UIKit

class ChatViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var messageSendButton: UIButton!
    
    private lazy var controller = ChatController(viewController: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        controller.viewDidLoad()
        
        setDelegates()
        configureUI()
        configureTableView()
        addDismissKeyboardTouch()
        
        shouldResizeForKeyboard = true
    }
    
    @IBAction func sendButtonClicked() {
        let text = messageTextField.text
        controller.sendButtonClicked(with: text)
        tableView.scrollToBottom()
    }
    
    private func setDelegates() {
        messageTextField.delegate = self
    }
    
    private func configureUI() {
        overrideUserInterfaceStyle = .dark
    }
    
    private func configureTableView() {
        tableView.keyboardDismissMode = .none
        tableView.separatorStyle = .none
    }
    
    deinit {
        shouldResizeForKeyboard = false
    }
}

extension ChatViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        sendButtonClicked()
        view.endEditing(true)
        return true
    }
}

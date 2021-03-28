//
//  ChatController.swift
//  Demo-DI
//
//  Created by Nikolay Gutorov on 3/28/21.
//

import UIKit

class ChatController: NSObject {
    
    weak var chatViewController: ChatViewController!
    
    private let dataProvider = ChatDataProvider()
    private lazy var dataSource = ChatDataSource(dataProvider: dataProvider)
    private lazy var chatIneractor = ChatInteractor(dataProvider: dataProvider)
    
    var tableView: UITableView! {
        return chatViewController.tableView
    }
    
    init(viewController: ChatViewController) {
        self.chatViewController = viewController
    }
    
    func delegate() {
        tableView.delegate = self
        tableView.dataSource = dataSource
    }
    
    func viewDidLoad() {
        delegate()
        reload()
    }
    
    func sendButtonClicked(with messageText: String?) {
        
        guard let text = messageText, !text.isEmpty else {
            chatViewController.showAlert(with: "Text is empty!", message: "Please enter the text")
            return
        }
        
        chatIneractor.send(text: text)
        reload()
    }
    
    func reload() {
        chatIneractor.fetchMessages()
        tableView.reloadData()
        chatViewController.messageTextField.text = nil
    }
}

extension ChatController: UITableViewDelegate {
    
}

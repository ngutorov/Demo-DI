//
//  ChatInteractor.swift
//  Demo-DI
//
//  Created by Nikolay Gutorov on 4/2/21.
//

import Foundation

class ChatInteractor {
    
    private let chatService: ChatService = ChatServiceImplementation()
    private let dataProvider: ChatDataProvidable?
    
    init(dataProvider: ChatDataProvider) {
        self.dataProvider = dataProvider
    }
    
    func send(text: String) {
        chatService.sendMessage(text: text) { (result) in
            print("Message sent with \(result)!")
        }
    }
    
    func fetchMessages() {
        chatService.fetchMessages { (messages) in
            self.dataProvider?.load(messages: self.split(messages: messages))
        }
    }
    
    func split(messages: [Message]) -> [[Message]] {
        var splittedData: [[Message]] = []
        
        for message in messages {
            splittedData.append([message])
        }
        
        return splittedData
    }
}

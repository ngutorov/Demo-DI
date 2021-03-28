//
//  ChatServiceImplementation.swift
//  Demo-DI
//
//  Created by Nikolay Gutorov on 4/2/21.
//

import Foundation

class ChatServiceImplementation: ChatService {
    
    private var messages: [Message] = []
    
    func fetchMessages(with completion: @escaping ([Message]) -> ()) {
        completion(messages)
    }
    
    func sendMessage(text: String, completion: @escaping (SendMessageResult) -> ()) {
        let message = Message(text: text)
        messages.append(message)
        completion(.success)
    }
}

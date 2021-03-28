//
//  ChatService.swift
//  Demo-DI
//
//  Created by Nikolay Gutorov on 4/2/21.
//

import Foundation

protocol ChatService {
    
    func fetchMessages(with completion: @escaping ([Message]) -> ())
    func sendMessage(text: String, completion: @escaping (SendMessageResult) -> ())
}

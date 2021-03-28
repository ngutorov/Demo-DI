//
//  ChatDataProvider.swift
//  Demo-DI
//
//  Created by Nikolay Gutorov on 3/28/21.
//

import Foundation

protocol ChatDataProvidable {
    
    func numberOfSections() -> Int
    func numberOfRows(in section: Int) -> Int
    func load(messages: [[Message]])
    func getMessage(by indexPath: IndexPath) -> Message
}

class ChatDataProvider: ChatDataProvidable {
    
    typealias Model = Message
    private var models: [[Model]] = []
        
    func numberOfSections() -> Int {
        return self.models.count
    }
    
    func numberOfRows(in section: Int) -> Int {
        return self.models[section].count
    }
    
    func load(messages: [[Message]]) {
        self.models = messages
    }
    
    func getMessage(by indexPath: IndexPath) -> Message {
        return models[indexPath.section][indexPath.row]
    }
}

//
//  Message.swift
//  Demo-DI
//
//  Created by Nikolay Gutorov on 3/30/21.
//

import Foundation

struct Message {
    
    var id: String
    var text = String()
    
    init() {
        self.id = MessageID.init().stringValue
    }
    
    init(text: String) {
        self.init()
        self.text = text
    }
}

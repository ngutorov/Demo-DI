//
//  ID.swift
//  Demo-DI
//
//  Created by Nikolay Gutorov on 3/30/21.
//

import UIKit

class MessageID {
    
    var stringValue: String
    
    init() {
        self.stringValue = UUID.init().uuidString
    }
}

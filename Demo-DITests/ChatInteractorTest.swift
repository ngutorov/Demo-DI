//
//  ChatInteractorTest.swift
//  Demo-DITests
//
//  Created by Nikolay Gutorov on 4/4/21.
//

import XCTest
@testable import Demo_DI

class ChatInteractorTests: XCTestCase {
    
    func testSplitting_1() {
        
        let dataProvider = ChatDataProvider()
        let chatInteractor = ChatInteractor(dataProvider: dataProvider)
        
        let message = (0..<10).map { (i) -> Message in
            let message = Message.init(text: "\(i)")
            return message
        }
        
        let splittedArray = chatInteractor.split(messages: message)
        
        // 1. Section count == Row count
        XCTAssertEqual(message.count, splittedArray.count)
        
        // 2. Valid sorted
        XCTAssertEqual(message.map{$0.text}, splittedArray.flatMap{$0}.map{$0.text})
    }
}

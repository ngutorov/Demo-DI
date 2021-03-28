//
//  InjectInteractor.swift
//  Demo-DI
//
//  Created by Nikolay Gutorov on 4/2/21.
//

import Foundation
import Swinject

class InjectInteractor {
    
    private let container = Container()
    
    func get<T>(_ type: T.Type) -> T? {
        return container.resolve(type)
    }
    
    func register() {
        
        container.register(ChatViewController.self) { (r) -> ChatViewController in
            let i = ChatViewController()
            return i
        }
        
        container.register(MainRouter.self) { (r) -> MainRouter in
            let i = MainRouter(viewController: r.resolve(ChatViewController.self))
            return i
        }
    }
}

//
//  Router.swift
//  Demo-DI
//
//  Created by Nikolay Gutorov on 4/2/21.
//

import UIKit

class MainRouter {
    
    var viewController: UIViewController?
    
    init(viewController: UIViewController?) {
        self.viewController = viewController
    }
    
    func root(window: inout UIWindow) {
        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }
}

//
//  SceneDelegate.swift
//  Demo-DI
//
//  Created by Nikolay Gutorov on 3/28/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    private let injectInteractor = InjectInteractor()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        // Registering dependencies for MainRouter.
        injectInteractor.register()
        
        let mainRouter = injectInteractor.get(MainRouter.self)
        
        if var window = window {
            mainRouter?.root(window: &window)
        } else {
            return
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {}

    func sceneDidBecomeActive(_ scene: UIScene) {}

    func sceneWillResignActive(_ scene: UIScene) {}

    func sceneWillEnterForeground(_ scene: UIScene) {}

    func sceneDidEnterBackground(_ scene: UIScene) {}
}


//
//  SceneDelegate.swift
//  KeywordNews
//
//  Created by Sean Lee on 2023/08/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?

  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = (scene as? UIWindowScene) else { return }
    
    window = UIWindow(windowScene: windowScene)
    window?.backgroundColor = .systemBackground
    window?.rootViewController = UINavigationController(rootViewController: NewsListViewController())
    window?.makeKeyAndVisible()
  }

    


}


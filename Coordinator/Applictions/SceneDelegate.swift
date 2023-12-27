//
//  SceneDelegate.swift
//  Coordinator
//
//  Created by Steven Kirke on 12.12.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: UIWindow?

	// MARK: - Dependencies
	private var appCoordinator: AppCoordinator!

	func scene(
		_ scene: UIScene,
		willConnectTo session: UISceneSession,
		options connectionOptions: UIScene.ConnectionOptions
	) {
		guard let scene = (scene as? UIWindowScene) else { return }
		let window = UIWindow(windowScene: scene)

		let navigationController = UINavigationController()
		appCoordinator = AppCoordinator(navigateController: navigationController)
		window.rootViewController = navigationController
		window.makeKeyAndVisible()

		appCoordinator.start()

		self.window = window
	}
}

//
//  SecondCoordinator.swift
//  Coordinator
//
//  Created by Steven Kirke on 13.12.2023.
//

import UIKit

protocol ISecondCoordinator: ICoordinator {
	func showSecondScene()
}

final class SecondCoordinator: ISecondCoordinator {

	var childCoordinators: [ICoordinator] = []

	var finishDelegate: ICoordinatorFinishDelegate?

	var navigateController: UINavigationController

	internal init(navigateController: UINavigationController) {
		self.navigateController = navigateController
	}

	func start() {
		showSecondScene()
	}

	func showSecondScene() {
		let assambly = SecondConfigurator()
		let secondVC = assambly.configure(viewController: SecondViewController())
		navigateController.pushViewController(secondVC, animated: true)
	}
}

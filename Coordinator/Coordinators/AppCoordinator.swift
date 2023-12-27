//
//  AppCoordinator.swift
//  Coordinator
//
//  Created by Steven Kirke on 13.12.2023.
//

import UIKit

protocol IAppCoordinator: ICoordinator {
	func showFirstFlow()
	func showSecondFlow()
	func showThirdFlow()
	func showFourthFlow()
}

final class AppCoordinator: IAppCoordinator {

	var childCoordinators: [ICoordinator] = []

	var finishDelegate: ICoordinatorFinishDelegate?

	var navigateController: UINavigationController

	internal init(navigateController: UINavigationController) {
		self.navigateController = navigateController
	}

	func start() {
		showFirstFlow()
	}

	func finish() { }

	func showFirstFlow() {
		let coordinator = FirstCoordinator(navigateController: navigateController)
		coordinator.finishDelegate = self
		coordinator.start()
	}

	func showSecondFlow() {
		let coordinator = SecondCoordinator(navigateController: navigateController)
		coordinator.finishDelegate = self
		coordinator.start()
	}

	func showThirdFlow() { }

	func showFourthFlow() { }
}

extension AppCoordinator: ICoordinatorFinishDelegate {
	func didFinish(coordinator: ICoordinator) {
		switch coordinator {
		case is IFirstCoordinator:
			childCoordinators.removeAll()
			showSecondFlow()
		default:
			break
		}
	}
}

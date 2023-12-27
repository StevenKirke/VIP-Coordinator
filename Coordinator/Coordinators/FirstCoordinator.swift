//
//  FirstCoordinator.swift
//  Coordinator
//
//  Created by Steven Kirke on 13.12.2023.
//

import UIKit

protocol IFirstCoordinator: ICoordinator {
	func showFirstScene()
}

final class FirstCoordinator: IFirstCoordinator {

	var childCoordinators: [ICoordinator] = []

	var finishDelegate: ICoordinatorFinishDelegate?

	var navigateController: UINavigationController

	var modelForTransfer: FirstModel.ViewModel?

	internal init(navigateController: UINavigationController) {
		self.navigateController = navigateController
	}

	func start() {
		showFirstScene()
	}

	func showFirstScene() {
		let assambly = FirstConfigurator()
		let viewController = FirstViewController()
		let firstVC = assambly.configure(
			viewController: viewController,
			firstSceneClosure: handlingResult
		)
		print("modelForTransfer \(modelForTransfer)")
		navigateController.pushViewController(firstVC, animated: true)
	}
}

private extension FirstCoordinator {
	private func handlingResult(
		result: Result<FirstModel.Responce.AnimalResponce, ResponceError>
	) {
		let model: FirstModel.ViewModel
		switch result {
		case .success(let result):
			model = .success(FirstModel.ViewModel.AnimalViewModel(
				pet: result.pet,
				animal: result.name,
				image: result.image
			))
		case .failure(let error):
			model = .error(error.errorDescription)
		}
		modelForTransfer = model
	}
}

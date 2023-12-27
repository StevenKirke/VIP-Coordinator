//
//  FirstConfigurator.swift
//  Coordinator
//
//  Created by Steven Kirke on 13.12.2023.
//

import Foundation

typealias FirstVC = FirstViewController

final class FirstConfigurator {
	func configure(viewController: FirstVC, firstSceneClosure: FirstSceneClosure?) -> FirstVC {

		let worker = FirstWorker()
		let presenter = FirstPresenter(
			firstSceneClosure: firstSceneClosure,
			testClosure: {}
		)
		let iterator = FirstIterator(presenter: presenter, worker: worker)

		viewController.iteractor = iterator

		return viewController
	}
}

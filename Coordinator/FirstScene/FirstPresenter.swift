//
//  FirstPresenter.swift
//  Coordinator
//
//  Created by Steven Kirke on 13.12.2023.
//

import Foundation

typealias FirstSceneClosure = (Result<FirstModel.Responce.AnimalResponce, ResponceError>) -> Void
typealias Responce = FirstModel.Responce

// Presentation logic
protocol IFirstPresenter: AnyObject {
	/// Function transfers data from 'Iterator' in 'Presenter'
	/// - Parameters:
	///   - responce: Accepts 'FirstModel.Responce'
	func present(responce: Responce)
}

final class FirstPresenter {

	// MARK: - Public properties
	var firstResultClosure: FirstSceneClosure?
	var testClosure: () -> Void

	// MARK: - Initializator
	internal init(
		firstSceneClosure: FirstSceneClosure?,
		testClosure: @escaping () -> Void
	) {
		self.firstResultClosure = firstSceneClosure
		self.testClosure = testClosure
	}
}

extension FirstPresenter: IFirstPresenter {
	func present(responce: Responce) {
		firstResultClosure?(responce.responceResult)
		testClosure()
	}
}

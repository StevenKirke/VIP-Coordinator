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

	// MARK: - Initializator
	internal init(firstSceneClosure: FirstSceneClosure?) {
		self.firstResultClosure = firstSceneClosure
	}
}

extension FirstPresenter: IFirstPresenter {
	func present(responce: Responce) {
		firstResultClosure?(responce.responceResult)
	}
}

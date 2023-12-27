//
//  FirstIterator.swift
//  Coordinator
//
//  Created by Steven Kirke on 13.12.2023.
//

import Foundation

typealias Request = FirstModel.Request

// Business logic
protocol IFirstIterator: AnyObject {
	/// Function transfers data from 'View' in 'Iterator'
	///
	/// - Parameters:
	///   - request: Accepts 'FirstModel.Request'
	func fetch(request: Request)
}

final class FirstIterator {

	// MARK: - Dependencies
	var presenter: IFirstPresenter?
	var worker: IFirstWorker

	// MARK: - Initializator
	internal init(
		presenter: IFirstPresenter,
		worker: IFirstWorker
	) {
		self.presenter = presenter
		self.worker = worker
	}
}

extension FirstIterator: IFirstIterator {
	func fetch(request: Request) {
		let result = worker.animal(animal: request.animal)
		let responce: FirstModel.Responce
		switch result {
		case .success(let animal):
				responce = FirstModel.Responce(responceResult: .success(FirstModel.Responce.AnimalResponce(
				id: animal.id,
				pet: animal.pet,
				name: animal.name,
				image: animal.image
			)))
		case .failure(let error):
				responce = FirstModel.Responce(responceResult: .failure(error))
		}
		presenter?.present(responce: responce)
	}
}

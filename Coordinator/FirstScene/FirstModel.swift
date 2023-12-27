//
//  FirstModel.swift
//  Coordinator
//
//  Created by Steven Kirke on 13.12.2023.
//

import Foundation

// swiftlint:disable nesting
enum FirstModel {
	struct Request {
		let animal: String
	}

	struct Responce {
		var responceResult: Result<AnimalResponce, ResponceError>

		struct AnimalResponce {
			let id: Int
			let pet: Bool
			let name: String
			let image: String
		}
	}

	enum ViewModel {
		case success(AnimalViewModel)
		case error(String)

		struct	AnimalViewModel {
			let pet: Bool
			let animal: String
			let image: String
		}
	}
}
// swiftlint:enable nesting

// Обработка ошибки 'Responce'
extension ResponceError {
	var errorDescription: String {
		var error = ""
		switch self {
		case .emptyAnimal:
			error = "No animal selected"
		case .wrongAnimal:
			error = "No signal server"
		}
		return error
	}
}

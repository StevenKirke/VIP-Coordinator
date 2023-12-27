//
//  FirstWorked.swift
//  Coordinator
//
//  Created by Steven Kirke on 13.12.2023.
//

import Foundation

protocol IFirstWorker: AnyObject {
	func animal(animal: String) -> Result<Animal, ResponceError>
}

struct Animal {
	let id: Int
	let pet: Bool
	let name: String
	let image: String
}

enum ResponceError: Error {
	case emptyAnimal
	case wrongAnimal
}

final class FirstWorker: IFirstWorker {
	func animal(animal: String) -> Result<Animal, ResponceError> {
		let currentAnimal: Result<Animal, ResponceError>
		switch animal {
		case "Cat":
			currentAnimal = .success(Animal(
				id: 45,
				pet: true,
				name: "Cat",
				image: "😸"
			))
		case "Dog":
			currentAnimal = .success(Animal(
				id: 45,
				pet: true,
				name: "Dog",
				image: "🐶"
			))
		case "Bear":
			currentAnimal = .success(Animal(
				id: 45,
				pet: false,
				name: "Bear",
				image: "🐻"
			))
		case "Mouse":
			currentAnimal = .success(Animal(
				id: 45,
				pet: false,
				name: "Mouse",
				image: "🐭"
			))
		case "":
			currentAnimal = .failure(.emptyAnimal)
		default:
			currentAnimal = .failure(.wrongAnimal)
		}
		return currentAnimal
	}
}

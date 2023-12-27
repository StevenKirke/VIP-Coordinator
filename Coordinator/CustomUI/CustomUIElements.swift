//
//  CustomUIElements.swift
//  Coordinator
//
//  Created by Steven Kirke on 12.12.2023.
//

import UIKit

final class CustomUIElements {
	// Create UI Element
	func createButton() -> UIButton {
		let button = UIButton()
		button.configuration = .filled()
		button.configuration?.cornerStyle = .medium
		button.configuration?.baseBackgroundColor = .gray
		button.translatesAutoresizingMaskIntoConstraints = false

		return button
	}

	func createLabel() -> UILabel {
		let label = UILabel()
		label.textColor = UIColor.black
		label.font =  UIFont.systemFont(ofSize: 16)
		label.textAlignment = .center
		label.translatesAutoresizingMaskIntoConstraints = false

		return label
	}

	func createSegment(items: [String]) -> UISegmentedControl {
		let segument = UISegmentedControl(items: items)
		segument.selectedSegmentIndex = 0
		segument.backgroundColor = .gray
		segument.tintColor = .black
		segument.layer.cornerRadius = 7
		segument.translatesAutoresizingMaskIntoConstraints = false

		return segument
	}

	func createLoader() -> UIImageView {
		let name = "arrow.2.circlepath"
		let image = UIImage(systemName: name)?
			.withRenderingMode(.alwaysTemplate)
		let imageView = UIImageView(image: image)
		imageView.contentMode = .scaleAspectFill
		imageView.tintColor = .black
		imageView.translatesAutoresizingMaskIntoConstraints = false

		return imageView
	}
}

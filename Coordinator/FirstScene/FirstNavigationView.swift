//
//  FirstNavigationView.swift
//  Coordinator
//
//  Created by Steven Kirke on 12.12.2023.
//

import UIKit

typealias ViewModel = FirstModel.ViewModel

// Display logic
protocol IFirstDisplay: AnyObject {
	/// Function for display for 'View'
	///
	/// - Parameters:
	///   - viewModel: Accepts 'FirstModel.ViewModel'
	///
	/// - Note: Function show 'ViewModel'
	func render(viewModel: ViewModel)
}

final class FirstViewController: UIViewController {

	// MARK: - Public properties
	var iteractor: IFirstIterator?

	// MARK: - Dependencies

	// MARK: - Private properties
	private let items = ["Cat", "Dog", "Bear", "Mouse"]
	private var currentAnimal = ""
	private var isLoader: Bool = false

	var modelForDisplay: FirstModel.ViewModel?

	private let customUI = CustomUIElements()
	private lazy var labelImage: UILabel = customUI.createLabel()
	private lazy var loader: UIImageView = customUI.createLoader()
	private lazy var label: UILabel = customUI.createLabel()
	private lazy var segment: UISegmentedControl = customUI.createSegment(items: items)
	private lazy var buttonNext: UIButton = customUI.createButton()

	// MARK: - Initializator
	init() {
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder: NSCoder) {
		super.init(coder: coder)
	}
	// MARK: - Lifecycle

	// MARK: - Public methods
	override func viewDidLoad() {
	 super.viewDidLoad()
		setupConficuration()
	}

	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		setupLayout()
	}
	// MARK: - Private methods

}

// Init View
private extension FirstViewController {
	private func setupConficuration() {
		view.backgroundColor = .white
		title = "First screen"

		labelImage.text = "🙄"
		labelImage.font = UIFont.systemFont(ofSize: 120)
		label.text = items.first
		currentAnimal = items.first ?? ""

		loader.isHidden = true

		segment.addTarget(self, action: #selector(changeSeqment(_:)), for: .valueChanged)

		buttonNext.configuration?.title = "Click"
		buttonNext.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)

		view.addSubview(labelImage)
		view.addSubview(label)
		view.addSubview(segment)
		view.addSubview(buttonNext)
		view.addSubview(loader)
	}
}

// Setup View
private extension FirstViewController {
	private func setupLayout() {
		let padding: CGFloat = 40
		NSLayoutConstraint.activate([
			label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
			label.leadingAnchor.constraint(
				equalTo: view.leadingAnchor,
				constant: padding
			),
			label.trailingAnchor.constraint(
				equalTo: view.trailingAnchor,
				constant: -padding
			),

			labelImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			labelImage.bottomAnchor.constraint(equalTo: label.topAnchor, constant: -padding),

			segment.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			segment.leadingAnchor.constraint(
				equalTo: view.leadingAnchor,
				constant: padding
			),
			segment.trailingAnchor.constraint(
				equalTo: view.trailingAnchor,
				constant: -padding
			),
			segment.topAnchor.constraint(equalTo: label.bottomAnchor, constant: padding / 2),

			buttonNext.heightAnchor.constraint(equalToConstant: padding),
			buttonNext.widthAnchor.constraint(equalToConstant: 160),
			buttonNext.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			buttonNext.topAnchor.constraint(
				equalTo: segment.bottomAnchor,
				constant: padding / 2
			),

			loader.widthAnchor.constraint(equalToConstant: 28),
			loader.heightAnchor.constraint(equalToConstant: 28),
			loader.leadingAnchor.constraint(
				equalTo: buttonNext.trailingAnchor,
				constant: 10
			),
			loader.centerYAnchor.constraint(equalTo: buttonNext.centerYAnchor, constant: 0)
		])
	}
}

// Action UI
private extension FirstViewController {

	@objc private func changeSeqment(_ segmentedControl: UISegmentedControl) {
		if segmentedControl.selectedSegmentIndex <= items.count {
			currentAnimal = items[segmentedControl.selectedSegmentIndex]
			reloadView()
		}
	}

	@objc private func didTapButton() {
		let request = FirstModel.Request(animal: currentAnimal)
		isLoader = true
		loaderImage()
		iteractor?.fetch(request: request)
	}

	private func reloadView() {
		label.text = currentAnimal
	}

	private func loaderImage() {
		loader.isHidden = false
		loader.rotate(isActive: isLoader)
	}
}

// Инициализируем 'IFirstDisplay'
extension FirstViewController: IFirstDisplay {
	func render(viewModel: ViewModel) {
		DispatchQueue.main.asyncAfter(deadline: .now() + 2) {

		}
	}
}

private extension UIView {
	func rotate(isActive: Bool) {
		let angle = isActive ? Double.pi * 2 : 0
		let rotation: CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
		rotation.toValue = NSNumber(value: angle)
		rotation.duration = 1
		rotation.isCumulative = true
		rotation.repeatCount = Float.greatestFiniteMagnitude
		self.layer.add(rotation, forKey: "rotationAnimation")
	}
}

//
//  SecondViewController.swift
//  Coordinator
//
//  Created by Steven Kirke on 13.12.2023.
//

import UIKit

// Display logic
protocol ISecondDisplay: AnyObject {
	/// Function for display for 'View'
	///
	/// - Parameters:
	///   - viewModel: Accepts 'FirstModel.ViewModel'
	///
	/// - Note: Function show 'ViewModel'
	func render(viewModel: ViewModel)
}

final class SecondViewController: UIViewController {

	// MARK: - Public properties

	// MARK: - Dependencies

	// MARK: - Private properties
	private var items: [String] = []
	private var currentAnimal = ""

	private let customUI = CustomUIElements()
	private lazy var labelImage: UILabel = customUI.createLabel()
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
private extension SecondViewController {
	private func setupConficuration() {
		view.backgroundColor = .white
		title = "Second screen"

		labelImage.text = "🙄"
		labelImage.font = UIFont.systemFont(ofSize: 120)
		label.text = items.first

		segment.addTarget(self, action: #selector(changeSeqment(_:)), for: .valueChanged)

		buttonNext.configuration?.title = "Click"
		buttonNext.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)

		view.addSubview(labelImage)
		view.addSubview(label)
		view.addSubview(segment)
		view.addSubview(buttonNext)
	}
}

// Setup View
private extension SecondViewController {
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
			)
		])
	}
}

// Action UI
private extension SecondViewController {

	@objc private func changeSeqment(_ segmentedControl: UISegmentedControl) {
		if segmentedControl.selectedSegmentIndex <= items.count {
			currentAnimal = items[segmentedControl.selectedSegmentIndex]
			reloadView()
		}
	}

	@objc private func didTapButton() {
		print("Tap button")
	}

	private func reloadView() {
		label.text = currentAnimal
	}
}

// Инициализируем 'IFirstDisplay'
extension SecondViewController: IFirstDisplay {
	func render(viewModel: ViewModel) {
		print("viewModel \(viewModel)")
	}
}

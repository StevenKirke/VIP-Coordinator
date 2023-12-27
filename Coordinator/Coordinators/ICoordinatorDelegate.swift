//
//  ICoordinatorDelegate.swift
//  Coordinator
//
//  Created by Steven Kirke on 13.12.2023.
//

import Foundation

protocol ICoordinatorFinishDelegate: AnyObject {
	func didFinish(coordinator: ICoordinator)
}

//
//  CoordinateType.swift
//  GooDic
//
//  Created by ttvu on 9/30/20.
//  Copyright © 2020 paxcreation. All rights reserved.
//

import UIKit

protocol CoordinateType {
    var parentCoord: CoordinateType? { get set }
    var viewController: UIViewController! { get }
    
    func start() // setup dependencies: view, viewModel, useCase, navigator
}

extension CoordinateType {
    func push(animated: Bool = true) {
        parentCoord?.viewController.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func present(animated: Bool = true, completion: (()->Void)? = nil) {
        parentCoord?.viewController.present(viewController, animated: animated, completion: completion)
    }
}

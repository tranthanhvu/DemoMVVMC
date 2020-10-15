//
//  SecondCoordinator.swift
//  TestMVVMC
//
//  Created by ttvu on 10/1/20.
//

import UIKit

protocol SecondNavigateType {
    func pop()
}

class SecondCoordinator: CoordinateProtocol {
    var parentCoord: CoordinateProtocol?
    
    weak var viewController: UIViewController! = {
        SecondViewController.instantiate(storyboard: .main)
    }()
    
    init(parentCoord: CoordinateProtocol) {
        self.parentCoord = parentCoord
    }
    
    func start() {
        guard let vc = viewController as? SecondViewController else { return }
        
        let useCase = SecondUseCase()
        let viewModel = SecondViewModel(navigator: self, useCase: useCase)
        vc.bindViewModel(viewModel)
    }
}

extension SecondCoordinator: SecondNavigateType {
    func pop() {
        viewController.navigationController?.popViewController(animated: true)
    }
}

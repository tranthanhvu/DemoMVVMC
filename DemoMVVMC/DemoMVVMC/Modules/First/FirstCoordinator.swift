//
//  FirstCoordinator.swift
//  TestMVVMC
//
//  Created by ttvu on 10/1/20.
//

import UIKit

protocol FirstNavigateType {
    func toSecondView()
}

class FirstCoordinator: CoordinateProtocol {
    var parentCoord: CoordinateProtocol?
    
    weak var viewController: UIViewController! = {
        FirstViewController.instantiate(storyboard: .main)
    }()
    
    init(parentCoord: CoordinateProtocol) {
        self.parentCoord = parentCoord
    }
    
    @discardableResult
    func prepare() -> CoordinateProtocol {
        guard let vc = viewController as? FirstViewController else { return self }
        
        let useCase = FirstUseCase()
        let viewModel = FirstViewModel(navigator: self, useCase: useCase)
        vc.bindViewModel(viewModel)
        
        return self
    }
}

extension FirstCoordinator: FirstNavigateType {
    func toSecondView() {
        SecondCoordinator(parentCoord: self)
            .prepare()
            .push()
    }
}

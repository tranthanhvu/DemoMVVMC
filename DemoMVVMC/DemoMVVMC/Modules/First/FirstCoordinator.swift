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

class FirstCoordinator: CoordinateType {
    var parentCoord: CoordinateType?
    
    weak var viewController: UIViewController! = {
        FirstViewController.instantiate(storyboard: .main)
    }()
    
    init(parentCoord: CoordinateType) {
        self.parentCoord = parentCoord
    }
    
    func start() {
        guard let vc = viewController as? FirstViewController else { return }
        
        let useCase = FirstUseCase()
        let viewModel = FirstViewModel(navigator: self, useCase: useCase)
        vc.bindViewModel(viewModel)
    }
}

extension FirstCoordinator: FirstNavigateType {
    func toSecondView() {
        let coord = SecondCoordinator(parentCoord: self)
        coord.start()
        coord.push()
        
        
    }
}

//
//  AppCoordinator.swift
//  TestMVVMC
//
//  Created by ttvu on 10/1/20.
//

import UIKit

class AppCoordinator: CoordinateProtocol {
    var parentCoord: CoordinateProtocol?
    
    lazy var viewController: UIViewController! = {
        UINavigationController()
    }()
    
    var window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        guard let nc = viewController as? UINavigationController else { return }
        
        let firstCoord = FirstCoordinator(parentCoord: self)
        firstCoord.prepare()
        
        nc.setViewControllers([firstCoord.viewController], animated: false)
        window.rootViewController = nc
        window.makeKeyAndVisible()
    }
}

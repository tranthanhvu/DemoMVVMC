//
//  ViewBindableType.swift
//  GooDic
//
//  Created by ttvu on 9/30/20.
//  Copyright © 2020 paxcreation. All rights reserved.
//

import UIKit

protocol ViewBindableType: class {
    associatedtype ViewModelType
    
    var viewModel: ViewModelType! { get set }
    
    func bindViewModel()
}

extension ViewBindableType where Self: UIViewController {
    func bindViewModel(_ vm: Self.ViewModelType) {
        viewModel = vm
        self.loadViewIfNeeded()
        bindViewModel()
    }
}

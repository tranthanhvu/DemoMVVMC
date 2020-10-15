//
//  SecondViewController.swift
//  TestMVVMC
//
//  Created by ttvu on 10/1/20.
//

import UIKit
import RxSwift
import RxCocoa

class SecondViewController: UIViewController, ViewBindableProtocol {
    
    @IBOutlet weak var actionButton: UIButton!
    
    let disposeBag = DisposeBag()
    var viewModel: SecondViewModel!
    
    deinit {
        print("deinit SecondViewController")
    }
    
    func bindViewModel() {
        let input = SecondViewModel.Input(closeTrigger: actionButton.rx.tap.asDriver())
        
        let output = viewModel.transform(input)
        
        output.closed
            .drive()
            .disposed(by: self.disposeBag)
    }
}

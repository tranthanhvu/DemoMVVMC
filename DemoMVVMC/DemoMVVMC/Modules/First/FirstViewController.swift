//
//  FirstViewController.swift
//  TestMVVMC
//
//  Created by ttvu on 10/1/20.
//

import UIKit
import RxSwift
import RxCocoa

class FirstViewController: UIViewController, ViewBindableProtocol {
    
    @IBOutlet weak var actionButton: UIButton!
    
    let disposeBag = DisposeBag()
    var viewModel: FirstViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    deinit {
        print("deinit FirstViewController")
    }
    
    func bindViewModel() {
        let input = FirstViewModel.Input(pushTrigger: actionButton.rx.tap.asDriver())
        
        let output = viewModel.transform(input)
        
        output.pushed
            .drive()
            .disposed(by: self.disposeBag)
    }
}

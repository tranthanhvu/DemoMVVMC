//
//  FirstViewModel.swift
//  TestMVVMC
//
//  Created by ttvu on 10/1/20.
//

import Foundation
import RxSwift
import RxCocoa

struct FirstViewModel {
    let navigator: FirstNavigateType
    let useCase: FirstUseCaseType
}

extension FirstViewModel: ViewModelType {
    struct Input {
        let pushTrigger: Driver<Void>
    }
    
    struct Output {
        let pushed: Driver<Void>
    }
    
    func transform(_ input: Input) -> Output {
        let pushed = input.pushTrigger
            .do(onNext: self.navigator.toSecondView)
        
        return Output(pushed: pushed)
    }
}

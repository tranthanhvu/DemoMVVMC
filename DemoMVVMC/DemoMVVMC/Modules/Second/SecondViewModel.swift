//
//  SecondViewModel.swift
//  TestMVVMC
//
//  Created by ttvu on 10/1/20.
//

import Foundation
import RxSwift
import RxCocoa

struct SecondViewModel {
    let navigator: SecondNavigateType
    let useCase: SecondUseCaseType
}

extension SecondViewModel: ViewModelProtocol {
    struct Input {
        let closeTrigger: Driver<Void>
    }
    
    struct Output {
        let closed: Driver<Void>
    }
    
    func transform(_ input: Input) -> Output {
        let closed = input.closeTrigger
            .do(onNext: self.navigator.pop)
            
        return Output(closed: closed)
    }
}

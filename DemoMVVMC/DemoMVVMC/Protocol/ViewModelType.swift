//
//  ViewModelType.swift
//  GooDic
//
//  Created by ttvu on 9/30/20.
//  Copyright © 2020 paxcreation. All rights reserved.
//

import Foundation

protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    func transform(_ input: Input) -> Output
}

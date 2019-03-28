//
//  MathematicalService.swift
//  SimpleCalculator
//
//  Created by Alex on 26.03.19.
//  Copyright © 2019 alex. All rights reserved.
//

import Foundation

protocol MathematicalService   {
    func getMathResult(firstValue: Double,
                       operatorType: MathService.OperatorType?,
                       secondValue: Double?) throws -> String
}


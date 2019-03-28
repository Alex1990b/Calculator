//
//  CalculationError.swift
//  SimpleCalculator
//
//  Created by Alex on 26.03.19.
//  Copyright © 2019 alex. All rights reserved.
//

import Foundation

enum CalculationError: String, Error {
    case divideByZero = "Can not devide by zero"
    case unknownError = "Can not calculate"
}

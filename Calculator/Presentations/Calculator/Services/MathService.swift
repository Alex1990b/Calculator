//
//  MathService.swift
//  SimpleCalculator
//
//  Created by Alex on 26.03.19.
//  Copyright © 2019 alex. All rights reserved.
//

import Foundation

extension MathService {
    enum OperatorType: String, CaseIterable {
        case plus      = "+"
        case minus     = "-"
        case divide    = "/"
        case multiplie = "*"
    }
}

final class MathService: MathematicalService {
    
    var minimunFractionDigits: Int = 0
    var maximumFractionDigits: Int = 20
    
    private lazy var numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = maximumFractionDigits
        formatter.minimumFractionDigits = minimunFractionDigits
        
        return formatter
    }()
    
    func getMathResult(firstValue: Double,
                       operatorType: OperatorType?,
                       secondValue: Double?)  throws -> String {
        
        guard let operatorType = operatorType
            else { return numberFormatter.string(from: NSNumber(value: firstValue)) ?? "0"}
        
        guard let secondValue = secondValue else  { throw CalculationError.unknownError }
        
        if operatorType == .divide && secondValue == 0.0 {
            throw CalculationError.divideByZero
        }
                
        let operationExpression = "\(firstValue) \(operatorType.rawValue) \(secondValue)"
        
        print(operationExpression)
        let expression = NSExpression(format: operationExpression)
        
        guard let mathValue = expression.expressionValue(with: nil, context: nil) as? Double,
            let value = numberFormatter.string(from: NSNumber(value: mathValue))
            else { throw CalculationError.unknownError }
        
        return value
    }
}




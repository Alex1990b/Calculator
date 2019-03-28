//
//  CalculatorPresenter.swift
//  SimpleCalculator
//
//  Created by Alex on 26.03.19.
//  Copyright © 2019 alex. All rights reserved.
//

import Foundation

final class CalculatorPresenter: CalculatorPresenterProtocol {
   
    private var operationType: MathService.OperatorType?
    private var firstValue: Double? = 0.0
    private var secondValue: Double?
    private var result: String = "0"
    
    var mathService: MathService?
    weak var delegate: CalculatorView?
    
    func proccessDigit(_ digit: String?) {
        
        let newDigit = digit == "." && result.isEmpty ? "0." : digit
        result.append(newDigit ?? "")
        if operationType == nil {
            firstValue = Double(result)
        } else {
            secondValue = Double(result.components(separatedBy: "\(operationType!.rawValue) ")[1])
        }
        
        delegate?.updateResult(with: result)
    }
    
    func proccesMathOperation(_ operation: String) {
                
        if !result.isEmpty && firstValue != nil && operationType == nil {
            operationType = MathService.OperatorType(rawValue: operation)
            result.append(" ")
            result.append(operationType?.rawValue ?? "")
            result.append(" ")
        }
        
        delegate?.updateResult(with: result)
    }
    
    func clear() {
        resetResult()
        delegate?.updateResult(with: "")
    }
    
    func calculate() {
        
        guard let firstValue = firstValue else {  clear()
            return }
        
        do {
            
            guard let mathService = mathService  else { return }
            
            let mathResult = try mathService.getMathResult(firstValue: firstValue,
                                                       operatorType: operationType,
                                                       secondValue: secondValue)
            result = mathResult
            self.firstValue = Double(result)
            operationType = nil
            secondValue = nil
            delegate?.updateResult(with: mathResult)
            
        } catch let error as CalculationError {
            delegate?.showError(with: error.rawValue)
            resetResult()
        } catch {}
    }
}

private extension CalculatorPresenter {
    func resetResult() {
        result = ""
        firstValue = 0.0
        secondValue = nil
        operationType = nil
    }
}

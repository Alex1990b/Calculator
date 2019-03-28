//
//  CalculatorPresenterProtocol.swift
//  SimpleCalculator
//
//  Created by Alex on 26.03.19.
//  Copyright © 2019 alex. All rights reserved.
//

import Foundation

protocol CalculatorPresenterProtocol {
    func proccessDigit(_ digit: String?)
    func proccesMathOperation(_ operation: String)
    func calculate()
    func clear()
}

//
//  CalculatorView.swift
//  SimpleCalculator
//
//  Created by Alex on 26.03.19.
//  Copyright © 2019 alex. All rights reserved.
//

import Foundation

protocol CalculatorView: class {
    func updateResult(with result: String )
    func showError(with errorMessage: String)
}

//
//  ViewController.swift
//  SimpleCalculator
//
//  Created by Alex on 26.03.19.
//  Copyright © 2019 alex. All rights reserved.
//

import UIKit

final class CalculationViewController: UIViewController {
    
    //MARK : @IBOutlets
    
    @IBOutlet private weak var resultLabel: UILabel!
    
     //MARK : Properties
    
    var presenter: CalculatorPresenterProtocol?
}

//MARK : Actions

private extension CalculationViewController {
    
    @IBAction func clearButtonTapped(_ sender: UIButton) {
        presenter?.clear()
    }
    
    @IBAction func mathOperationButtonTapped(_ sender: UIButton) {
        presenter?.proccesMathOperation(sender.titleLabel?.text ?? "")
    }
    
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        presenter?.calculate()
    }
    
    @IBAction func digitButtonTapped(_ sender: UIButton) {
        presenter?.proccessDigit(sender.titleLabel?.text)
    }
    
}

//MARK : CalculatorView

extension CalculationViewController: CalculatorView {
    func updateResult(with result: String) {
        resultLabel.text = result.isEmpty ? "0" : result
    }
    
    func showError(with errorMessage: String) {
         resultLabel.text = errorMessage
    }
}


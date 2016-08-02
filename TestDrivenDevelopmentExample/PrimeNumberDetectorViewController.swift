//
//  PrimeNumberDetectorViewController.swift
//  PrimeNumberDetectorViewController
//
//  Created by Ryan Cortez on 8/2/16.
//  Copyright © 2016 Ryan Cortez. All rights reserved.
//

import UIKit

class PrimeNumberDetectorViewController: UIViewController, UITextFieldDelegate{
    
    // MARK: - Outlets
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var primeNumberResultLabel: UILabel!
    @IBOutlet weak var checkIfPrimeButton: UIButton!
    
    // MARK: - Inital Setup
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupCheckIfPrimeButton()
        self.textField.delegate = self
    }
    
    func setupCheckIfPrimeButton() {
        roundCornerOfView(self.checkIfPrimeButton)
        self.checkIfPrimeButton.backgroundColor = self.view.tintColor
        self.checkIfPrimeButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        self.checkIfPrimeButton.titleLabel?.textAlignment = NSTextAlignment.Center
    }
    
    func roundCornerOfView(view: UIView) {
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 10.0
    }
    
    // MARK: - App Logic

    func checkIfPrime(number: Int) -> String{
        if (number < 1 || 100 < number) {
            return "You typed: \"\(number)\". Please type a number between 1-100."
        }
        for currentNumber in 2...number {
            if (number % currentNumber == 0 && currentNumber != number) {
                return "\(number) is not a prime number."
            }
        }
        return "\(number) is a prime number."
    }
    
    // MARK: - TextField Delegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.textField.resignFirstResponder()
        checkIfPrimeButtonPressed(self.textField)
        return true
    }
    
    // MARK: - Actions
    @IBAction func checkIfPrimeButtonPressed(sender: AnyObject) {
        guard let input = self.textField.text else {
            self.primeNumberResultLabel.text = "You typed nothing. Please type a whole number."
            return
        }
        if (input == "") {
            return self.primeNumberResultLabel.text = "You typed nothing. Please type a whole number."

        }
        guard let integer = Int(input) else {
            self.primeNumberResultLabel.text = "You typed: \"\(input)\". Please type a whole number."
            return
        }
        self.primeNumberResultLabel.text = checkIfPrime(integer)
    }
}


//
//  TestDrivenDevelopmentExampleTests.swift
//  TestDrivenDevelopmentExampleTests
//
//  Created by Ryan Cortez on 8/2/16.
//  Copyright © 2016 Ryan Cortez. All rights reserved.
//

import XCTest
@testable import TestDrivenDevelopmentExample

class TestDrivenDevelopmentExampleTests: XCTestCase {
    
    private var storyboard :UIStoryboard!
    private var controller :PrimeNumberDetectorViewController!
    
    override func setUp() {
        super.setUp()
        let mainStoryboardName = "Main"
        let storyboardID = "PrimeNumberDetectorViewController"
        storyboard = UIStoryboard(name: mainStoryboardName, bundle: NSBundle.mainBundle())
        guard let primeNumberDetectorViewController = storyboard.instantiateViewControllerWithIdentifier(storyboardID) as?PrimeNumberDetectorViewController else {
            print("Did not find PrimeNumberDetectorViewController in Storyboard ID: \(storyboardID)"); return
        }
        controller = primeNumberDetectorViewController
        controller.loadView()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testIfATextFieldIsPresent() {
        XCTAssertNotNil(controller.textField)
    }
    
    func testIfALabelIsPresent() {
        XCTAssertNotNil(controller.primeNumberResultLabel)
    }
    
    func testIfAButtonIsPresent() {
        let button = UIButton()
        XCTAssertNotNil(controller.checkIfPrimeButton)
        XCTAssertNotNil(controller.checkIfPrimeButtonPressed(button))
    }
    
    func testIfAppDetectsKnownPrimeNumber() {
        let input = "5"
        controller.textField.text = input
        let button = UIButton()
        controller.checkIfPrimeButtonPressed(button)
        XCTAssert(controller.primeNumberResultLabel.text == "\(input) is a prime number.")
    }
    
    func testIfAppDetectsKnownNonPrimeNumber() {
        let input = "8"
        controller.textField.text = input
        let button = UIButton()
        controller.checkIfPrimeButtonPressed(button)
        
        XCTAssert(controller.primeNumberResultLabel.text == "\(input) is not a prime number.")
    }
    
    func testIfAppWillPreventDecimalNumbers() {
        let input = "2.0"
        controller.textField.text = input
        let button = UIButton()
        controller.checkIfPrimeButtonPressed(button)
        XCTAssert(controller.primeNumberResultLabel.text == "You typed: \"\(input)\". Please type a whole number.")
    }
    
    func testIfAppWillPreventNumberOutside1to100() {
        let input = "101"
        controller.textField.text = input
        let button = UIButton()
        controller.checkIfPrimeButtonPressed(button)
        XCTAssert(controller.primeNumberResultLabel.text == "You typed: \"\(input)\". Please type a number between 1-100.")
    }
    
    func testIfAppWillPreventSpecialCharacters() {
        let input = "^"
        controller.textField.text = input
        let button = UIButton()
        controller.checkIfPrimeButtonPressed(button)
        XCTAssert(controller.primeNumberResultLabel.text == "You typed: \"\(input)\". Please type a whole number.")
    }
    
    func testIfAppWillPreventLetters() {
        let input = "Y"
        controller.textField.text = input
        let button = UIButton()
        controller.checkIfPrimeButtonPressed(button)
        XCTAssert(controller.primeNumberResultLabel.text == "You typed: \"\(input)\". Please type a whole number.")
    }
    func testIfAppWillPreventNoInput() {
        let input = ""
        controller.textField.text = input
        let button = UIButton()
        controller.checkIfPrimeButtonPressed(button)
        XCTAssert(controller.primeNumberResultLabel.text == "You typed nothing. Please type a whole number.")
    }

}

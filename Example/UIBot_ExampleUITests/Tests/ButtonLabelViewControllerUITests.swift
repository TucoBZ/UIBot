//
//  ButtonLabelViewControllerUITests.swift
//  UIBot_ExampleUITests
//
//  Created by Tulio Bazan on 05/11/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import XCTest
import UIBot

class ButtonLabelViewControllerUITests: XCTestCase, UIBot.Bottable {
    
    var caseTest: XCTestCase { return self }
    let app: XCUIApplication = XCUIApplication() 

    override func setUp() {
        continueAfterFailure = false

        app.launchArguments += ["UI_TEST"]
        app.launchEnvironment["startViewController"] = ViewControllerType.buttonLabel.rawValue
        app.launch()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testTapPlus() {
        _ = ButtonLabelViewControllerBot(test: self)
            .tapPlusBtn()
            .tapPlusBtn()
            .tapPlusBtn()
            .assertCount(label: "3")
    }

    func testTapMinus() {
        _ = ButtonLabelViewControllerBot(test: self)
            .tapMinusBtn()
            .tapMinusBtn()
            .tapMinusBtn()
            .assertCount(label: "-3")
    }
    
    func testTapPlusAndMinus() {
        _ = ButtonLabelViewControllerBot(test: self)
            .tapPlusBtn()
            .tapPlusBtn()
            .tapPlusBtn()
            .assertCount(label: "3")
            .assertNotExits(label: "2")
            .tapMinusBtn()
            .tapMinusBtn()
            .tapMinusBtn()
            .assertCount(label: "0")
            .tapPlusBtn()
            .assertCount(label: "1")
            .tapMinusBtn()
            .assertCount(label: "0")
            .tapPlusBtn()
            .tapPlusBtn()
            .assertCount(label: "2")
            .tapMinusBtn()
            .tapMinusBtn()
            .assertCount(label: "0")
    }
    
    func testAssertLabels() {
        _ = ButtonLabelViewControllerBot(test: self)
            .assertPlusBtnLabel()
            .assertMinusBtnLabel()
            .assertCount(label: "0")
    }
}

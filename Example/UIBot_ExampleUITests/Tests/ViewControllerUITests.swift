//
//  ViewControllerUITests.swift
//  UIBot_Tests
//
//  Created by Túlio Bazan da Silva on 26/09/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import XCTest
import UIBot

class ViewControllerUITests: XCTestCase, UIBot.Bottable {
    
    var caseTest: XCTestCase { return self }
    let app: XCUIApplication = XCUIApplication()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testScrollAndTapAtCell() {
        ViewControllerBot(test: self)
            .scrollUntilFind(labelText: "50")
            .tapLabel(text: "50")
        
        ViewControllerBot(test: self)
            .assertHeaderCell(label: "50")
            .screenExists()
    }

    func testBackButton() {
        ViewControllerBot(test: self)
            .scrollUntilFind(labelText: "30")
            .tapLabel(text: "30")
        
        ViewControllerBot(test: self)
            .assertHeaderCell(label: "30")
            .scrollUntilFind(labelText: "49")
            .tapLabel(text: "49")
        
        ViewControllerBot(test: self)
            .assertHeaderCell(label: "49")
            .scrollUntilFind(labelText: "29")
            .tapLabel(text: "29")
        
        ViewControllerBot(test: self)
            .assertHeaderCell(label: "29")
            .tapBackButton()
        
        ViewControllerBot(test: self)
            .assertHeaderCell(label: "49")
            .tapBackButton()
        
        ViewControllerBot(test: self)
            .assertHeaderCell(label: "30")
            .tapBackButton()
        
        ViewControllerBot(test: self)
            .exists(text: "30")
    }
}


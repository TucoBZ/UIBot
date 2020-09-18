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
        continueAfterFailure = false

        app.launch()
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
            .assertIsVisible(text: "30")
    }

    func testTapAtCellIndex() {
        ViewControllerBot(test: self)
            .tapCell(at: 5)

        ViewControllerBot(test: self)
            .assertHeaderCell(label: "5")
    }

    func testBackFromSafari() {
        ViewControllerBot(test: self)
            .tapCell(at: 0)
            .wait(time: 2)
            .backFromSafari()

        ViewControllerBot(test: self)
    }
}



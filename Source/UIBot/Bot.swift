//
//  Bot.swift
//  UIBot
//
//  Created by Túlio Bazan da Silva on 25/09/18.
//

import XCTest

open class Bot {
    
    ///Application to check
    public let app: XCUIApplication
    
    ///The test running
    private let test: XCTestCase
    
    ///Test Timeout in Seconds
    var testTimeout: TimeInterval
    
    public init(test: Bottable, timeout: TimeInterval = 40.0) {
        self.app = test.app
        self.test = test.caseTest
        self.testTimeout = timeout
        
        guard let trait = trait() else { XCTFail(); return }
        self.test.wait(element: trait, by: testTimeout) { (error) in
            XCTAssertNil(error)
            sleep(1)
        }
    }
    
    ///Element that defines this Screen
    open func trait() -> XCUIElement? {
        return nil
    }
    
    ///Useful Query Elements at the screen
    func query() -> XCUIElementQuery {
        if app.scrollViews.otherElements.count > 0 {
            return app.scrollViews.otherElements
        } else {
            return app.otherElements
        }
    }
    
    ///Verifies if this Screen is presented
    public func screenExists() {
        XCTContext.runActivity(named: "Check if this Screen Exists") { _ in
            guard let trait = trait() else { XCTFail(); return }
            self.test.wait(element: trait, by: testTimeout) { (error) in
                XCTAssertNil(error)
            }
            XCTAssert(trait.exists)
        }
    }
    
    ///Write a Text into a TextField by Element ID
    public func write(text: String, atTextFieldWithID id: String) {
        XCTContext.runActivity(named: "Write '\(text)' at textField with id: \(id)") { _ in
            var textField: XCUIElement?
            if query().textFields[id].exists {
                textField = query().textFields[id]
            } else if query().secureTextFields[id].exists {
                textField = query().secureTextFields[id]
            } else {
                XCTFail()
            }
            
            textField?.tap()
            textField?.typeText(text)
        }
    }
    
    ///Tap a Button with an ID
    public func tapButton(id: String) {
        XCTContext.runActivity(named: "Tap at Button with id: \(id)") { _ in
            query().buttons[id].tap()
        }
    }
    
    ///Tap a Button with an ID
    public func tapLabel(text: String) {
        XCTContext.runActivity(named: "Tap at Label with text: \(text)") { _ in
            app.staticTexts[text].tap()
        }
    }
    
    ///Verifies that a Button with an ID has a specific Label
    public func assertButton(id: String, with label: String) {
        XCTContext.runActivity(named: "Exists Button with id: \(id) and label: \(label)") { _ in
            XCTAssert(query().buttons[id].label == label)
        }
    }
    
    ///Verifies if a text exists in Screen
    public func exists(text: String) {
        XCTContext.runActivity(named: "Exists Text: \(text)") { _ in
            let staticText = query().staticTexts[text]
            XCTAssert(staticText.isVisible)
        }
    }
    
    ///Verifies that a Button with an ID has a specific Label
    public func assertLabel(id: String, with text: String) {
        XCTContext.runActivity(named: "Exists Label with id: \(id) and text: \(text) ") { _ in
            let staticText = query().staticTexts[id]
            XCTAssert(staticText.label == text)
        }
    }
    
    ///Wait for a text Exists
    public func wait(for text: String) {
        XCTContext.runActivity(named: "Waiting for Text: \(text)") { _ in
            if query().staticTexts[text].waitForExistence(timeout: testTimeout) {
                sleep(1)
            } else {
                XCTFail()
            }
        }
    }
    
    ///Taps at Back Button (if it is the first element at NavigationBar)
    public func tapBackButton() {
        XCTContext.runActivity(named: "Tap at Back Button") { _ in
            app.navigationBars.buttons.element(boundBy: 0).tap()
        }
    }
    
    ///Try to scroll until element shows
    public func scrollTable(at index: Int, untilTextExists text: String, direction: SwipeDirection) {
        XCTContext.runActivity(named: "Scrolls TableView at index: \(index) until element exist at direction \(direction.description)") { _ in
            
            let expecation1 = test.expectation(description: "wait for element to show")
            
            while !app.staticTexts[text].isVisible {
                let tableView = app.tables.element(boundBy: index)
                if tableView.exists {
                    direction.swipe(at: tableView)
                } else {
                    XCTFail()
                }
            }
            
            expecation1.fulfill()
            
            test.waitForExpectations(timeout: testTimeout, handler: { (error) in
                XCTAssertNil(error)
            })
        }
    }
    
    ///Verifies if a text exists in NavigationBar
    public func assertNavigationBar(title: String) {
        XCTContext.runActivity(named: "Exists Text: \(title) in the NavigationBar") { _ in
            XCTAssert(app.navigationBars[title].exists)
        }
    }
    
}

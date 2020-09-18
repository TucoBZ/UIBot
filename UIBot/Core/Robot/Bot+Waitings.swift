//
//  Bot+Waitings.swift
//  UIBot
//
//  Created by Túlio Bazan da Silva on 17/09/20.
//

import XCTest

//MARK: Waitings
extension Bot {
    
    ///Wait for a label Exists, including StaticTexts and Button Labels
    @discardableResult
    public func wait(text: String) -> Self  {
        XCTContext.runActivity(named: "Waiting for Text: \(text)") { _ in
            if app.staticTexts[text].waitForExistence(timeout: testTimeout) || app.buttons[text].waitForExistence(timeout: testTimeout) {
                sleep(1)
            } else {
                XCTFail("Test Timeout, text '\(text)' did not appear")
            }
        }
        return self
    }
    
    ///Waits for a View with an id to exists
    @discardableResult
    public func waitView(id: String) -> Self {
        XCTContext.runActivity(named: "Waiting for View with Id: \(id)") { _ in
            if app.otherElements[id].waitForExistence(timeout: testTimeout) {
                sleep(1)
            } else {
                XCTFail("Test Timeout, view with id '\(id)' did not appear")
            }
        }
        return self
    }
    
    ///Waits for a Elements to not exists
    @discardableResult
    public func waitToNotExist(element: XCUIElement) -> Self {
        XCTContext.runActivity(named: "Wait Until Element: \(element) not Exist") { _ in
            self.test.waitToNotExist(element: element, by: testTimeout) { (error) in
                XCTAssertNil(error, "Test Timeout, element '\(element)' exists")
                sleep(1)
            }
        }
        return self
    }
    
    ///Wait a time in seconds
    @discardableResult
    public func wait(time: UInt32) -> Self {
        XCTContext.runActivity(named: "Wait a time: \(time) seconds") { _ in
            sleep(time)
            XCTAssert(true)
        }
        return self
    }
    
}

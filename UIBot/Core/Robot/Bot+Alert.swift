//
//  Bot+Alert.swift
//  UIBot
//
//  Created by Túlio Bazan da Silva on 17/09/20.
//

import XCTest

//MARK: Alerts
extension Bot {
 
    ///Asserts Alert Title
    @discardableResult
    public func assertAlert(title: String) -> Self {
        XCTContext.runActivity(named: "Assert if Alert Title is: \(title)") { _ in
            XCTAssert(app.alerts.staticTexts[title].exists, "Alert title '\(title)', do not exists")
        }
        return self
    }
    
    ///Asserts Alert Message
    @discardableResult
    public func assertAlert(message: String) -> Self {
        XCTContext.runActivity(named: "Assert if Alert message is: \(message)") { _ in
            XCTAssert(app.alerts.staticTexts[message].exists, "Alert message '\(message)', do not exists")
        }
        return self
    }
    
    ///Asserts Alert Button title and tap it
    @discardableResult
    public func tapAlertButton(title: String) -> Self {
        XCTContext.runActivity(named: "Assert Alert Button Title is: \(title) and tap it") { _ in
            let button = app.alerts.element(boundBy: 0).buttons[title]
            XCTAssert(button.exists, "Alert button with title '\(title)', do not exists")
            button.tap()
        }
        return self
    }

}

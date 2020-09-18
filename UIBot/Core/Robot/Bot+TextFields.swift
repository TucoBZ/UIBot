//
//  Bot.swift
//  UIBot
//
//  Created by Túlio Bazan da Silva on 17/09/20.
//

import XCTest

//MARK: TextFields
extension Bot {
    
    ///Write a Text into a TextField by Element ID
    @discardableResult
    public func write(text: String, atTextFieldWithID id: String) -> Self {
        XCTContext.runActivity(named: "Write '\(text)' at textField with id: \(id)") { _ in
            var textField: XCUIElement?
            if app.textFields[id].exists {
                textField = app.textFields[id]
            } else if app.secureTextFields[id].exists {
                textField = app.secureTextFields[id]
            } else {
                XCTFail("Do not exists a textField with id: \(id)")
            }
            
            textField?.tap()
            textField?.typeText(text)
        }
        return self
    }
    
}

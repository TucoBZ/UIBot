//
//  Bot+Taps.swift
//  UIBot
//
//  Created by Túlio Bazan da Silva on 17/09/20.
//

import XCTest

//MARK: Taps
extension Bot {
 
    ///Tap a Button with an ID
    @discardableResult
    public func tapButton(id: String) -> Self  {
        XCTContext.runActivity(named: "Tap at Button with id: \(id)") { _ in
            app.buttons[id].tap()
        }
        return self
    }
    
    
    ///Tap a Visible Label with a Text
    @discardableResult
    public func tapLabel(text: String) -> Self  {
        XCTContext.runActivity(named: "Tap at Label with text: \(text)") { _ in
            let predicate = NSPredicate(format: "label LIKE %@", text)
            let labelText = app.staticTexts.element(matching: predicate)
            let buttonLabelText = app.buttons.element(matching: predicate)
            if labelText.exists {
                labelText.tap()
            } else if buttonLabelText.exists {
                buttonLabelText.tap()
            } else {
                XCTFail("No label '\(text)' found to Tap")
            }
        }
        return self
    }
    
    
    ///Taps at Back Button (if it is the first element at NavigationBar)
    @discardableResult
    public func tapBackButton() -> Self {
        XCTContext.runActivity(named: "Tap at Back Button") { _ in
            app.navigationBars.buttons.element(boundBy: 0).tap()
        }
        return self
    }
    
    ///Tap a view with Id
    @discardableResult
    public func tapView(id: String) -> Self {
        XCTContext.runActivity(named: "Tap View with Id: \(id)") { _ in
            app.otherElements[id].tap()
        }
        return self
    }
    
    //Tap at coordinate
    @discardableResult
    public func tapCoordinate(x xCoordinate: Double, y yCoordinate: Double)  -> Self {
        let normalized = app.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 0))
        let coordinate = normalized.withOffset(CGVector(dx: xCoordinate, dy: yCoordinate))
        coordinate.tap()
        return self
    }
    
    //Given safari is in Foreground, tap at back to App
    @discardableResult
    public func backFromSafari() -> Self {
        XCTContext.runActivity(named: "Given safari is in Foreground, tap at back to App") { _ in
            let safari = XCUIApplication(bundleIdentifier: "com.apple.mobilesafari")
            XCTAssert(safari.wait(for: .runningForeground, timeout: testTimeout))
            let normalized = safari.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 0))
            let coordinate = normalized.withOffset(CGVector(dx: 5, dy: 10))
            coordinate.tap()
        }
        return self
    }
}

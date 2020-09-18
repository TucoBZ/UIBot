//
//  Bot+Asserts.swift
//  UIBot
//
//  Created by Túlio Bazan da Silva on 17/09/20.
//

import XCTest

//MARK: Asserts
extension Bot {
    
    ///Assert a Label with text exists
    @discardableResult
    open func assert(label text: String) -> Self {
        XCTContext.runActivity(named: "Check if Exists a label: \(text)") { _ in
            let predicate = NSPredicate(format: "label LIKE %@", text)
            let labelText = app.staticTexts.element(matching: predicate)
            let buttonLabelText = app.buttons.element(matching: predicate)
            XCTAssert(labelText.exists || buttonLabelText.exists, "Not Exist label: '\(text)'")
        }
        return self
    }
    
    ///Assert a Label with text not exists
    @discardableResult
    open func assertNotExits(label text: String) -> Self {
        XCTContext.runActivity(named: "Check if Exists a label: \(text)") { _ in
            let predicate = NSPredicate(format: "label LIKE %@", text)
            let labelText = app.staticTexts.element(matching: predicate)
            let buttonLabelText = app.buttons.element(matching: predicate)
            XCTAssertFalse(labelText.exists || buttonLabelText.exists, "Exist label: '\(text)'")
        }
        return self
    }
    
    ///Assert a Label that contains a substring
    @discardableResult
    open func assertContains(text: String) -> Self {
        XCTContext.runActivity(named: "Check if Exists a label that contains substring: \(text)") { _ in
            let predicate = NSPredicate(format: "label CONTAINS %@", text)
            let labelText = app.staticTexts.element(matching: predicate)
            let buttonLabelText = app.buttons.element(matching: predicate)
            XCTAssert(labelText.exists || buttonLabelText.exists, "Not Exist substring: '\(text)'")
        }
        return self
    }
   
    ///Verifies if this Screen is presented
    @discardableResult
    public func screenExists() -> Self {
        XCTContext.runActivity(named: "Check if this Screen Exists") { _ in
            guard let trait = trait() else { XCTFail(); return }
            self.test.wait(element: trait, by: testTimeout) { (error) in
                XCTAssertNil(error, "Timeout!")
            }
            XCTAssert(trait.exists, "Not Exist trait: '\(trait)'")
        }
        return self
    }
    
    
    ///Verifies that a Button with an ID has a specific Label
    @discardableResult
    public func assertButton(id: String, with label: String) -> Self {
        XCTContext.runActivity(named: "Exists Button with id: \(id) and label: \(label)") { _ in
            XCTAssert(app.buttons[id].label == label, "Not Exist Button with id: '\(id)' and '\(label)'")
        }
        return self
    }
    
    ///Verifies if a text exists in Screen, including Label and Buttons Label
    @discardableResult
    public func assertIsVisible(text: String) -> Self  {
        XCTContext.runActivity(named: "Exists Text: \(text)") { _ in
            let predicate = NSPredicate(format: "label LIKE %@", text)
            let labelText = app.staticTexts.element(matching: predicate)
            let buttonLabelText = app.buttons.element(matching: predicate)
            XCTAssert(labelText.isVisible || buttonLabelText.isVisible, "Not Visible Label: '\(text)'")
        }
        return self
    }
    
    ///Verifies that a Button with an ID has a specific Label
    @discardableResult
    public func assertLabel(id: String, with text: String) -> Self  {
        XCTContext.runActivity(named: "Exists Label with id: \(id) and text: \(text) ") { _ in
            let staticText = app.staticTexts[id]
            XCTAssert(staticText.label == text, "Not Exist Label with id: '\(id)' and '\(text)'")
        }
        return self
    }
    
    ///Verifies if a text exists in NavigationBar
    @discardableResult
    public func assertNavigationBar(title: String) -> Self {
        XCTContext.runActivity(named: "Exists Text: \(title) in the NavigationBar") { _ in
            XCTAssert(app.navigationBars[title].exists, "Not exist a NAvigationBar with Title: '\(title)'")
        }
        return self
    }
    
    ///Verifies that a Image with an ID exists
    @discardableResult
    public func assertImage(id: String) -> Self {
        XCTContext.runActivity(named: "Exists Image with id: \(id)") { _ in
            XCTAssert(app.images[id].exists, "Not exist a ImageView with id: '\(id)'")
        }
        return self
    }
    
    ///Verifies that a Button with an ID exists or not
    @discardableResult
    public func assertButton(id: String, exists: Bool = true) -> Self {
        XCTContext.runActivity(named: "\(exists ? "Exists" : "Not Exists") Button with id: \(id)") { _ in
            if exists {
                XCTAssertTrue(app.buttons[id].exists, "Not exist a Button with id: '\(id)'")
            } else {
                XCTAssertFalse(app.buttons[id].exists, "Exist a Button with id: '\(id)'")
            }
        }
        return self
    }

}

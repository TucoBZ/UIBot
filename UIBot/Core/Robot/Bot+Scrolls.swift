//
//  Bot+Scrolls.swift
//  UIBot
//
//  Created by Túlio Bazan da Silva on 17/09/20.
//

import XCTest

//MARK: Scrolls
extension Bot {

    ///Try to scroll TableView, ScrollView or CollectionView at index, until element shows
    @discardableResult
    public func scroll(at index: Int, untilElementExists element: XCUIElement, direction: SwipeDirection) -> Self {
        XCTContext.runActivity(named: "Scrolls TableView, ScrollView or CollectionView at index: \(index) until element exist at direction \(direction.description)") { _ in
            
            let expecation1 = test.expectation(description: "wait for element to show")
            
            while !element.isVisible {
                let tableView: XCUIElement = app.tables.element(boundBy: index)
                let scrollView: XCUIElement = app.scrollViews.element(boundBy: index)
                let collectionView: XCUIElement = app.collectionViews.element(boundBy: index)
                
                if tableView.exists {
                    direction.swipe(at: tableView)
                } else if scrollView.exists {
                    direction.swipe(at: scrollView)
                } else if collectionView.exists {
                    direction.swipe(at: collectionView)
                } else {
                    XCTFail("Not exists a scrollView to scroll at index: \(index)")
                }
            }
            
            expecation1.fulfill()
            
            test.waitForExpectations(timeout: testTimeout, handler: { (error) in
                XCTAssertNil(error, "test Timeout, element '\(element)' did not appear")
            })
        }
        return self
    }

    
    ///Try to scroll TableView, ScrollView and CollectionView at index, until Text shows
    @discardableResult
    public func scroll(at index: Int, untilTextExists text: String, direction: SwipeDirection) -> Self {
        return scroll(at: index, untilElementExists: app.staticTexts[text], direction: direction)
    }

}

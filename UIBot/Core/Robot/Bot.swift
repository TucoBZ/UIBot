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
    
    ///The running test 
    internal let test: XCTestCase
    
    ///Test Timeout in Seconds
    var testTimeout: TimeInterval
    
    public init(test: Bottable, timeout: TimeInterval = 3.0) {
        self.app = test.app
        self.test = test.caseTest
        self.testTimeout = timeout
        
        guard let trait = trait() else { XCTFail("There is no Element to check if this controller is on screen"); return }
        self.test.wait(element: trait, by: testTimeout) { (error) in
            XCTAssertNil(error, "The trait element was not found")
            sleep(1)
        }
    }
    
    ///Element that defines this Screen
    open func trait() -> XCUIElement? {
        return nil
    }

}

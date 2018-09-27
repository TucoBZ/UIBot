//
//  XCTestCase+UIBot.swift
//  UIBot
//
//  Created by Túlio Bazan da Silva on 25/09/18.
//

import Foundation
import XCTest

extension XCTestCase {
    
    func wait(element: XCUIElement, by duration: TimeInterval, completionHandler: @escaping (Error?) -> Void ) {
        
        let exists = NSPredicate(format: "exists == true")
        
        expectation(for: exists, evaluatedWith: element) { () -> Bool in
            return true
        }
        
        waitForExpectations(timeout: duration) { (error) in
            completionHandler(error)
        }
    }
}

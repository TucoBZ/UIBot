//
//  XCUIElement+UIBot.swift
//  UIBot
//
//  Created by Túlio Bazan da Silva on 27/09/18.
//

import Foundation
import XCTest

extension XCUIElement {
    
    var isVisible: Bool {
        
        guard self.exists && self.isHittable && !self.frame.isEmpty else {
            return false
        }
        
        return XCUIApplication().windows.element(boundBy: 0).frame.contains(self.frame)
    }
}

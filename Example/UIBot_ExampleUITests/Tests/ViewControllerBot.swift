//
//  ViewControllerBot.swift
//  UIBot_Tests
//
//  Created by Túlio Bazan da Silva on 26/09/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import XCTest
import UIBot

class ViewControllerBot: Bot {
    
    //Asserts
    let title: String = "Screen"
    let header: String = "Last Selection"
    
    override func trait() -> XCUIElement? {
        return app.navigationBars[title]
    }

    @discardableResult
    func scrollUntilFind(labelText: String) -> Self {
        return scroll(at: 0, untilTextExists: labelText, direction: .up)
    }

    @discardableResult
    func assertHeaderCell(label text: String) -> Self {
        return assertIsVisible(text: "\(header) \(text)")
    }
}

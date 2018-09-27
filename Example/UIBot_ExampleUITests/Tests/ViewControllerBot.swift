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
    
    func scrollUntilFind(labelText: String) -> ViewControllerBot {
        scrollTable(at: 0, untilTextExists: "50", direction: .up)
        return self
    }

    func assertHeaderCell(label text: String) -> ViewControllerBot {
        exists(text: "\(header) \(text)")
        return self
    }
}

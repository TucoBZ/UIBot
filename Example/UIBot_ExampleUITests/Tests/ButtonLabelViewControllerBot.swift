//
//  ButtonLabelViewControllerBot.swift
//  UIBot_ExampleUITests
//
//  Created by Tulio Bazan on 05/11/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import XCTest
import UIBot

class ButtonLabelViewControllerBot: Bot {
    
    //Asserts
    let minusBtn: String = "minus_btn"
    let plusBtn: String = "plus_btn"
    let countLabel: String = "count_lbl"
    
    override func trait() -> XCUIElement? {
        return app.staticText[countLabel]
    }
    
    func tapPlusBtn() -> Self {
        return tapButton(id: plusBtn)
    }
    
    func tapMinusBtn() -> Self {
        return tapButton(id: minusBtn)
    }
    
    func assertCount(label text: String) -> Self {
        return assert(text: "\(text)")
    }
    
    func assertPlusBtnLabel() -> Self {
        return assert(text: "+")
    }
    
    func assertMinusBtnLabel() -> Self {
        return assert(text: "-")
    }
}

//
//  BottableProtocol.swift
//  UIBot
//
//  Created by Túlio Bazan da Silva on 25/09/18.
//

import XCTest

protocol Bottable {
    func application() -> XCUIApplication
    func caseTest() -> XCTestCase
}

extension Bottable where  Self: XCTestCase {
    func caseTest() -> XCTestCase {
        return self
    }
}

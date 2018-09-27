//
//  BottableProtocol.swift
//  UIBot
//
//  Created by Túlio Bazan da Silva on 25/09/18.
//

import XCTest

public protocol Bottable {
    var app: XCUIApplication {get}
    var caseTest: XCTestCase {get}
}

extension Bottable where  Self: XCTestCase {
    var caseTest: XCTestCase { return self }
    var app: XCUIApplication { return XCUIApplication() }
}

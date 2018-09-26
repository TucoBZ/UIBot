//
//  SwipeDirection.swift
//  Pods-UIBot_Example
//
//  Created by Túlio Bazan da Silva on 26/09/18.
//

import XCTest

enum SwipeDirection {
    case up
    case down
    case left
    case right
    
    func swipe(at element: XCUIElement) {
        switch self {
        case .up:
            element.swipeUp()
        case .down:
            element.swipeDown()
        case .left:
            element.swipeLeft()
        case .right:
            element.swipeRight()
        }
    }
    
    var description: String {
        switch self {
        case .up:
            return "up"
        case .down:
            return "down"
        case .left:
            return "left"
        case .right:
            return "right"
        }
    }
}

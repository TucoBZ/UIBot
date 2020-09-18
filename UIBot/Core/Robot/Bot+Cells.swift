//
//  Bot+Cells.swift
//  UIBot
//
//  Created by Túlio Bazan da Silva on 17/09/20.
//

import XCTest

//MARK: Cells
extension Bot {
    
    ///Tap a Cell at index
    @discardableResult
    public func tapCell(at index: Int) -> Self {
        XCTContext.runActivity(named: "Tap a Cell at index: \(index)") { _ in
            app.cells.element(boundBy: index).tap()
        }
        return self
    }
    
}

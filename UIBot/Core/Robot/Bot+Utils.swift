//
//  Bot+Utils.swift
//  UIBot
//
//  Created by Túlio Bazan da Silva on 17/09/20.
//

import XCTest

//MARK: Utils
extension Bot {

    ///Text from Label with Id
    public func stringFromLabel(with id: String) -> String? {
        return app.staticTexts[id].label
    }
    
    ///Text from Button with Id
    public func stringFromButton(with id: String) -> String? {
        return app.buttons[id].label
    }

}

//
//  JSONDataTypePattern.swift
//  JSONParser
//
//  Created by yuaming on 2017. 12. 5..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

struct JSONDataTypePattern {
    static let leftSquareBracket = "["
    static let rightSquareBracket = "]"
    static let leftBrace = "{"
    static let rightBrace = "}"
    static let doubleQuotation = "\""
    static let comma = ","
    static let number = "^[\\d]+"
    static let bool = "true|false"
}
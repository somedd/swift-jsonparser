//
//  main.swift
//  JSONParser
//
//  Created by Jack (2017/12/19)
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

var runJsonParser : Bool = true
mainLoop : while runJsonParser == true {
    
    let userInput = InputView().readInput()
    guard userInput != "q" else { break }
    guard GrammarChecker().isValid(userInput: userInput) == true else { continue }
    
    let convertedData = DataFactory().generateData(userInput)
    let numbersOfData = DataCounter().countNumberOfData(convertedData)
    
    OutputView().printResultOfData(numbersOfData)
}

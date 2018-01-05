//
//  main.swift
//  JSONParser
//
//  Created by Jack (2017/12/19)
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

let outputView : OutputView = OutputView()
var runJSONParser : Bool = true
var outputFileName = ""
var userInput = ""
var resultOfData : String = ""
var userDirectory = ""
var currentDirectory = FileManager.default.currentDirectoryPath


while runJSONParser {
    if CommandLine.arguments.count == 1 {
        outputView.printMessages(.inputMessage)
        userInput = InputView().readConsoleInput()
        guard userInput != "q" else { break }
    }
    if CommandLine.arguments.count >= 2 {
        outputView.printMessages(.pathMessage)
        userDirectory = InputView().readConsoleInput()
        userInput = try InputView().readFile(CommandLine.arguments[1], userPath: userDirectory != "" ? userDirectory : currentDirectory )
    }
    if CommandLine.arguments.count == 3 {
        outputFileName = CommandLine.arguments[2]
    }

    guard GrammarChecker().isValid(userInput: userInput) else {
        outputView.printMessages(.formatError)
        continue
    }
    let convertedData = DataFactory().generateData(userInput)
    let numbersOfData = DataCounter().countNumberOfData(convertedData)
    
    if CommandLine.arguments.count >= 2 {
        outputView.printCountOfData(numbersOfData, false)
        outputView.printShapeOfData(convertedData, false)
        try outputView.writeFile(resultData: resultOfData, outputFileName, currentDirectory)
        break
    }
    
    outputView.printCountOfData(numbersOfData, true)
    outputView.printShapeOfData(convertedData, true)

}
    

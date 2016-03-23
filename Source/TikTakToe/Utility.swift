//
//  Utility.swift
//  TikTakToe
//
//  Created by Raul Ferreira on 3/22/16.
//  Copyright © 2016 FCUP. All rights reserved.
//

import Foundation

// Adds all the Utilities
func getUtility(table: [[Character]]) -> Int{

    let mdUtil = getMDUtility(table, symbol: computerSymbol)  - getMDUtility(table, symbol:playerSymbol)
    let sdUtil = getSDUtility(table, symbol: computerSymbol)  - getSDUtility(table, symbol:playerSymbol)
    let roUtil = getRowUtility(table, symbol: computerSymbol) - getRowUtility(table, symbol:playerSymbol)
    let coUtil = getColUtility(table, symbol: computerSymbol) - getColUtility(table, symbol:playerSymbol)

    return mdUtil+sdUtil+roUtil+coUtil;
}

// Calculates the Main Diagonal Utility
func getMDUtility(table: [[Character]], symbol: Character) -> Int {

    if (table[0][0] == symbol || table[0][0] == " ") &&
        (table[1][1] == symbol || table[1][1] == " ") &&
        (table[2][2] == symbol || table[2][2] == " ") {
        return 1
    }

    return 0
}

// Calculates the Secondary Diagonal Utility
func getSDUtility(table: [[Character]], symbol: Character) -> Int  {
    if (table[0][2] == symbol || table[0][2] == " ") &&
        (table[1][1] == symbol || table[1][1] == " ") &&
        (table[2][0] == symbol || table[2][0] == " ") {
        return 1
    }

    return 0
}

// Calculates the Utiity for all Rows
func getRowUtility(table: [[Character]], symbol:Character) -> Int{
    for row in 0..<3 {
        if (table[row][0] == symbol || table[row][0] == " ") &&
            (table[row][1] == symbol || table[row][1] == " ") &&
            (table[row][2] == symbol || table[row][2] == " ") {
            return 1
        }
    }
    return 0
}

// Calculates the Utiity for all Columns
func getColUtility(table: [[Character]], symbol:Character) -> Int{
    for col in 0..<3 {
        if (table[0][col] == symbol || table[0][col] == " ") &&
            (table[1][col] == symbol || table[1][col] == " ") &&
            (table[2][col] == symbol || table[2][col] == " ") {
            return 1
        }
    }
    return 0
}


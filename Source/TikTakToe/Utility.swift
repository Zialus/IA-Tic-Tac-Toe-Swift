//
//  Utility.swift
//  TikTakToe
//
//  Created by Raul Ferreira on 3/22/16.
//  Copyright © 2016 FCUP. All rights reserved.
//

import Foundation

func getUtility(table: [[Character]]) -> Int {

    // If someone has won atribute utility acordingly
    let (bool, winnerSymbol) = checkWinner(table)
    if bool {
        if winnerSymbol == computerSymbol {
            return 100
        }
        if winnerSymbol == humanSymbol {
            return -100
        }
        //There are no more cases but whatever
    }

    // Otherwise calculate utility the usual way
    let mdUtil = getMDUtility(table, symbol: computerSymbol)  - getMDUtility(table, symbol:humanSymbol)
    let sdUtil = getSDUtility(table, symbol: computerSymbol)  - getSDUtility(table, symbol:humanSymbol)
    let roUtil = getRowUtility(table, symbol: computerSymbol) - getRowUtility(table, symbol:humanSymbol)
    let coUtil = getColUtility(table, symbol: computerSymbol) - getColUtility(table, symbol:humanSymbol)

    return mdUtil+sdUtil+roUtil+coUtil
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
func getSDUtility(table: [[Character]], symbol: Character) -> Int {
    if (table[0][2] == symbol || table[0][2] == " ") &&
        (table[1][1] == symbol || table[1][1] == " ") &&
        (table[2][0] == symbol || table[2][0] == " ") {
        return 1
    }

    return 0
}

// Calculates the Utiity for all Rows
func getRowUtility(table: [[Character]], symbol: Character) -> Int {
    var utility = 0
    for row in 0..<3 {
        if (table[row][0] == symbol || table[row][0] == " ") &&
            (table[row][1] == symbol || table[row][1] == " ") &&
            (table[row][2] == symbol || table[row][2] == " ") {
            utility+=1
        }
    }
    return utility
}

// Calculates the Utiity for all Columns
func getColUtility(table: [[Character]], symbol: Character) -> Int {
    var utility = 0
    for col in 0..<3 {
        if (table[0][col] == symbol || table[0][col] == " ") &&
            (table[1][col] == symbol || table[1][col] == " ") &&
            (table[2][col] == symbol || table[2][col] == " ") {
            utility+=1
        }
    }
    return utility
}

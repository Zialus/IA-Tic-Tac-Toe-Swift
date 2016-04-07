//
//  Checks.swift
//  TikTakToe
//
//  Created by Raul Ferreira on 3/17/16.
//  Copyright © 2016 FCUP. All rights reserved.
//

import Foundation

func whoWon(char: Character) -> String {

    switch char {
    case "O":
        if humanSymbol == "O"{
            return "You win!"
        } else {
            return "The Computer won!"
        }
    case "X":
        if humanSymbol == "X"{
            return "You win!"
        } else {
            return "The Computer won!"
        }
    default:
        return "Something weird happend :S"
    }

}

func checkWinner(gameTable: [[Character]]) -> (Bool, Character) {

    let rowWinner = checkRows(gameTable)
    if rowWinner != " " {
        return (true, rowWinner)
    }

    let colWinner = checkCols(gameTable)
    if colWinner != " " {
        return (true, colWinner)
    }

    let mdWinner = checkMainDiagonal(gameTable)
    if mdWinner != " " {
        return (true, mdWinner)
    }

    let sdWinner = checkSecondaryDiagonal(gameTable)
    if sdWinner != " " {
        return (true, sdWinner)
    }

    return (false, " ")
}

func checkRows(table: [[Character]]) -> Character {
    for row in 0..<3 {
        if (table[row][0]==table[row][1] && table[row][1]==table[row][2]) && table[row][0] != " " {
            return table[row][0]
        }
    }
    return " "
}


func checkCols(table: [[Character]]) -> Character {
    for col in 0..<3 {
        if (table[0][col]==table[1][col] && table[1][col]==table[2][col]) && table[0][col] != " " {
            return table[0][col]
        }
    }
    return " "
}


func checkMainDiagonal(table: [[Character]]) -> Character {
    if table[0][0]==table[1][1] && table[1][1]==table[2][2] {
        return table[1][1]
    }
    return " "
}

func checkSecondaryDiagonal(table: [[Character]] ) -> Character {
    if table[0][2]==table[1][1] && table[1][1]==table[2][0] {
        return table[1][1]
    }
    return " "
}


// Checks if the Game Table is fully occupied
func isFull(table: [[Character]]) -> Bool {

    for i in 0..<3 {
        for j in 0..<3 {
            if table[i][j] == " " {
                return false
            }
        }
    }

    return true
}

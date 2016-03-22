//
//  Checks.swift
//  TikTakToe
//
//  Created by Raul Ferreira on 3/17/16.
//  Copyright © 2016 FCUP. All rights reserved.
//

import Foundation

enum Winner {
    case player
    case computer
    case noWinner
}

func whoWon(c: Character) -> Winner{

    switch c {
    case "O":
        return Winner.computer
    case "X":
        return Winner.player
    case " ":
        return Winner.noWinner
    default:
        return Winner.noWinner
    }

}

func checkWinner(gameTable: [[Character]]) -> (Bool, Character){

    let rowWinner = checkRow(gameTable)

    if rowWinner != " " {
        return (true,rowWinner)
    }

//    if checkCol(gameTable) != " "
//    || checkMainDiagonal(gameTable) != " "
//    || checkSecondaryDiagonal(gameTable) != " "{
//        return true
//    }

    return (false," ")
}

func checkRow(table: [[Character]]) -> Character{
    for row in 0..<3 {
        if(table[row][0]==table[row][1] && table[row][1]==table[row][2]){
            return table[row][0]
        }
    }
    return " "
}


func checkCol(table: [[Character]]) -> Character{
    for col in 0..<3 {
        if(table[0][col]==table[1][col] && table[1][col]==table[2][col]){
            return table[0][col]
        }
    }
    return " "
}


func checkMainDiagonal(table: [[Character]]) -> Character {
    if(table[0][0] == table[1][1] && table[1][1] == table[2][2]){
        return table[1][1];
    }
    return " ";
}

func checkSecondaryDiagonal(table: [[Character]] ) -> Character {
    if(table[0][2]==table[1][1] && table[1][1]==table[2][0]){
        return table[1][1];
    }
    return " ";
}


// Checks if the Game Table is fully occupied
func isFull(table: [[Character]]) -> Bool{

    for i in 0..<3 {
        for j in 0..<3 {
            if table[i][j] == " " {
                return false
            }
        }
    }

    return true
}


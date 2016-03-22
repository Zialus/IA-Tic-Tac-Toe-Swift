//
//  main.swift
//  TikTakToe
//
//  Created by Raul Ferreira on 3/17/16.
//  Copyright © 2016 FCUP. All rights reserved.
//

import Foundation

let emptyChar: Character = " "

var gameTable = Array(count: 3, repeatedValue: Array(count: 3, repeatedValue: emptyChar ))

var game = State(table: gameTable, depth: 0,utility: 0)

let playerSymbol:Character = "X"
let computerSymbol:Character = "O"

while true {

    game.prettyPrint()

    let (bool,winner) = checkWinner(gameTable)

    if bool{
        print ("The winner is \(winner)")
        print("👏👏👏👏👏👏")
        exit(0)
    }

    var inputTuple = readPositionsFromUser()

    while inputTuple == nil {
        print()
        print("INVALID POSITION")
        print()
        sleep(1)
        inputTuple = readPositionsFromUser()
    }

    let (row,col) = inputTuple!

    if gameTable[row][col] == " " {
        gameTable[row][col] = playerSymbol
    }
    else{
        print()
        print("Can't play on a position that has already been chosen")
        print()
        sleep(1)
    }

    game = State(table: gameTable,depth: 1, utility: 1)
    
}

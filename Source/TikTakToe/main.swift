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

while true {

    game.prettyPrint()

    var inputTuple = readPositionsFromUser()

    while inputTuple == nil {
        print()
        print("YOU IDIOT")
        print()
        sleep(1)
        inputTuple = readPositionsFromUser()
    }

    let (row,col) = inputTuple!

    if gameTable[row][col] == " " {
        gameTable[row][col] = "O"
    }
    
    game = State(table: gameTable,depth: 1, utility: 1)
    
}

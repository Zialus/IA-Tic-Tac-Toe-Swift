//
//  main.swift
//  TikTakToe
//
//  Created by Raul Ferreira on 3/17/16.
//  Copyright © 2016 FCUP. All rights reserved.
//

import Foundation

enum Turn {
    case Human
    case Computer
}

let emptyChar: Character = " "

let initialGameTable = Array(count: 3, repeatedValue: Array(count: 3, repeatedValue: emptyChar ))

var game = State(table: initialGameTable, depth: 0,utility: 0)

let humanSymbol:Character
let computerSymbol:Character

var charFromUser = readCharacterFromUser()
while charFromUser == nil{
    charFromUser = readCharacterFromUser()
}

humanSymbol = charFromUser!
if humanSymbol == "O"{
    computerSymbol = "X"
} else {
    computerSymbol = "O"
}

var goesFirst = whoGoesFirst()
while goesFirst == nil{
    goesFirst = whoGoesFirst()
}

var whosTurn: Turn

if goesFirst == "P"{
    whosTurn = Turn.Human
} else {
    whosTurn = Turn.Computer
}


while true {

    game.prettyPrint()

    let (bool,winnerSymbol) = checkWinner(game.table)

    if bool{
        print("👏👏👏👏👏👏")
        let winnerString = whoWon(winnerSymbol)
        print (winnerString)
        print("👏👏👏👏👏👏")
        exit(0)
    }

    // If a winner can't be found but the the table is full declare a draw
    if isFull(game.table){
        print("It's a DRAW!!")
        exit(0)
    }


    if whosTurn == Turn.Human{

        // The table for the next State starts out as a copy of the table of the current State
        var nextGameTable = game.table

        humanInputInfiniteLoop: while true {

            var inputTuple = readPositionsFromUser()

            while inputTuple == nil {
                print()
                print("INVALID POSITION")
                print()
                sleep(1)
                inputTuple = readPositionsFromUser()
            }

            let (row,col) = inputTuple!

            if nextGameTable[row][col] != " " {
                print()
                print("Can't play on a position that has already been chosen")
                print()
                sleep(1)
                continue humanInputInfiniteLoop
            } else{
                nextGameTable[row][col] = humanSymbol
                break humanInputInfiniteLoop
            }



        }

        game = State(table: nextGameTable,depth: game.depth+1, utility: getUtility(game.table))


    }


    if whosTurn == Turn.Computer {
//        computerInputInfiniteLoop: while true{
//
//            let row = Int(arc4random_uniform(3))
//            let col = Int(arc4random_uniform(3))
//
//            if gameTable[row][col] != " " {
//                print()
//                print("Can't play on a position that has already been chosen")
//                print()
//                sleep(1)
//                continue computerInputInfiniteLoop
//            } else {
//                gameTable[row][col] = computerSymbol
//                break computerInputInfiniteLoop
//            }
//
//        }

        game = MINIMAX_DECISION(game)

    }





    switch whosTurn{
    case Turn.Human:
        whosTurn = Turn.Computer
    case Turn.Computer:
        whosTurn = Turn.Human
    }
    
}

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

var gameTable = Array(count: 3, repeatedValue: Array(count: 3, repeatedValue: emptyChar ))

var game = State(table: gameTable, depth: 0,utility: 0)

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

    let (bool,winnerSymbol) = checkWinner(gameTable)

    if bool{
        print("👏👏👏👏👏👏")
        let winnerString = whoWon(winnerSymbol)
        print (winnerString)
        print("👏👏👏👏👏👏")
        exit(0)
    }




    if whosTurn == Turn.Human{
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

            if game.table[row][col] != " " {
                print()
                print("Can't play on a position that has already been chosen")
                print()
                sleep(1)
                continue humanInputInfiniteLoop
            } else{
                game.table[row][col] = humanSymbol
                break humanInputInfiniteLoop
            }

        }



        game = State(table: game.table,depth: game.depth+1, utility: getUtility(game.table))

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

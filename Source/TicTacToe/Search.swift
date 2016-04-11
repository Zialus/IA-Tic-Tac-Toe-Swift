//
//  Search.swift
//  TikTakToe
//
//  Created by Raul Ferreira on 3/17/16.
//  Copyright © 2016 FCUP. All rights reserved.
//

import Foundation

func generateSuccessors(currentState: State, nextPlayerSymbol: Character) -> [State] {

    var successors = [State]()
    successors.reserveCapacity(10)

    let fatherTable = currentState.table
    let fatherDepth = currentState.depth

    for i in 0..<3 {
        for j in 0..<3 {
            if fatherTable[i][j] == " " {
                var childTable = fatherTable
                childTable[i][j] = nextPlayerSymbol
                let childState = State(table: childTable, depth: fatherDepth+1, utility: getUtility(childTable))
                successors.append(childState)
            }
        }
    }

    totalNodes+=successors.count

    return successors
}

func TERMINAL_TEST(someState: State) -> (Bool) {

    // The game might have eneded because there are no more moves left
    if isFull(someState.table) {
        return true
    }

    // Or because someone has won
    let (bool, _) = checkWinner(someState.table)

    // I don't need to know the winner, only wether there is a winner or not
    return bool

}


func MINIMAX_DECISION(currentState: State) -> (State) {

    let v = MAX_VALUE(currentState)

    // TODO: try to make this safer - Part1
    var chosenSuccessor = currentState.successors!.first

    var bestUtilitySoFar = Int.min
    if FULLDEBUG {
        print("number of successors:", terminator:"")
        print(currentState.successors!.count)
        print("Value we are searching for: \(v)...")
    }
    for s in currentState.successors! {
        if FULLDEBUG {
            s.prettyPrint()
            print("valor: \(s.value) , utilidade: \(s.utility)")
        }
        if s.value == v && s.utility > bestUtilitySoFar {
            chosenSuccessor = s
            bestUtilitySoFar = s.utility
        }
    }

    // TODO: try to make this safer - Part2
    return chosenSuccessor!

}



func MAX_VALUE(currentState: State) -> (Int) {

    if TERMINAL_TEST(currentState) {
        return currentState.utility
    }

    var v = Int.min
    currentState.successors = generateSuccessors(currentState, nextPlayerSymbol: computerSymbol)

    for s in currentState.successors! {
        let minVal = MIN_VALUE(s)
        s.value = minVal
        v = max(v, minVal)
    }

    return v
}


func MIN_VALUE(currentState: State) -> (Int) {

    if TERMINAL_TEST(currentState) {
        return currentState.utility
    }

    var v = Int.max
    currentState.successors = generateSuccessors(currentState, nextPlayerSymbol: humanSymbol)

    for s in currentState.successors! {
        let maxVal = MAX_VALUE(s)
        s.value = maxVal
        v = min(v, maxVal)
    }

    return v

}


func ALPHA_BETA_DECISION (currentState: State) -> (State) {

    let v = MAX_VALUE_AB(currentState, alfa: Int.min, beta: Int.max)

    // TODO: try to make this safer - Part1
    var chosenSuccessor = currentState.successors!.first

    var bestUtilitySoFar = Int.min

    if FULLDEBUG {
        print("number of successors:", terminator:"")
        print(currentState.successors!.count)
        print("Value we are searching for: \(v)...")
    }
    for s in currentState.successors! {
        if FULLDEBUG {
            s.prettyPrint()
            print("valor: \(s.value) , utilidade: \(s.utility)")
        }
        if s.value == v && s.utility > bestUtilitySoFar {
            chosenSuccessor = s
            bestUtilitySoFar = s.utility
        }
    }


    // TODO: try to make this safer - Part2
    return chosenSuccessor!

}

func MAX_VALUE_AB(currentState: State, alfa: Int, beta: Int) -> (Int) {
    var alfa = alfa

    if TERMINAL_TEST(currentState) {
        return currentState.utility
    }

    var v = Int.min
    currentState.successors = generateSuccessors(currentState, nextPlayerSymbol: computerSymbol)

    for s in currentState.successors! {
        let minVal = MIN_VALUE_AB(s, alfa: alfa, beta: beta)
        s.value = minVal
        v = max(v, minVal)
        if v > beta {
            return v
        }
        alfa = max(alfa, v)
    }

    return v
}

func MIN_VALUE_AB(currentState: State, alfa: Int, beta: Int) -> (Int) {
    var beta = beta

    if TERMINAL_TEST(currentState) {
        return currentState.utility
    }

    var v = Int.max
    currentState.successors = generateSuccessors(currentState, nextPlayerSymbol: humanSymbol)

    for s in currentState.successors! {
        let maxVal = MAX_VALUE_AB(s, alfa: alfa, beta: beta)
        s.value = maxVal
        v = min(v, maxVal)
        if v < alfa {
            return v
        }
        beta = min(beta, v)
    }

    return v

}

//
//  Search.swift
//  TikTakToe
//
//  Created by Raul Ferreira on 3/17/16.
//  Copyright © 2016 FCUP. All rights reserved.
//

import Foundation


func generateSuccessors(currentState: State, nextPlayerSymbol: Character) -> [State]{

    var successors = [State]()

    let fatherTable = currentState.table
    let fatherDepth = currentState.depth

    for i in 0..<3{
        for j in 0..<3 {
            if(fatherTable[i][j] == " "){
                var childTable = fatherTable
                childTable[i][j] = nextPlayerSymbol
                let childState = State(table: childTable, depth: fatherDepth+1, utility: getUtility(childTable))
                successors.append(childState)
            }
        }
    }

    return successors
}


func MINIMAX_DECISION(currentState: State) -> (State) {

    let successors = generateSuccessors(currentState, nextPlayerSymbol: computerSymbol)
    let v = MAX_VALUE(currentState)

    // TODO: try to make this safer - Part1
    var chosenSuccessor = successors.first

    for s in successors {
        if s.value == v{
            chosenSuccessor = s
            break
        }
    }

    // TODO: try to make this safer - Part2
    return chosenSuccessor!

}



func MAX_VALUE(currentState: State) -> (Int) {

    if TERMINAL_TEST(currentState){
        return currentState.utility
    }

    var v = Int.min
    let successors = generateSuccessors(currentState, nextPlayerSymbol: humanSymbol)

    for s in successors{
        v = max(v, MIN_VALUE(s))
        s.value = v
    }

    return v
}

func TERMINAL_TEST(someState: State) -> Bool {

    let (bool,_) = checkWinner(someState.table);

    return bool;

}

func MIN_VALUE(currentState: State) -> (Int) {

    if TERMINAL_TEST(currentState){
        return currentState.utility
    }

    var v = Int.max
    let successors = generateSuccessors(currentState, nextPlayerSymbol: humanSymbol)

    for s in successors{
        v = min(v, MAX_VALUE(s))
        s.value = v
    }

    return v

}

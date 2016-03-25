//
//  UserInterface.swift
//  TikTakToe
//
//  Created by Raul Ferreira on 3/17/16.
//  Copyright © 2016 FCUP. All rights reserved.
//

import Foundation

func readCharacterFromUser() -> Character? {

    print("Pick your weapon!\nPress (O) for Circle\t Press (X) for Cross: ", terminator:"")

    if let userInput = readLine(stripNewline: true) {
        if userInput == "O" {
            return "O"
        }
        if userInput == "X"{
            return "X"
        }
    }
    return nil
}

func whoGoesFirst() -> Character? {

    print("Pick who goes first\nPress (C) for Computer\t Press (P) for Player: ", terminator:"")

    if let userInput = readLine(stripNewline: true) {
        if userInput == "C" {
            return "C"
        }
        if userInput == "P"{
            return "P"
        }
    }
    return nil
}


func readPositionsFromUser() -> (row: Int,col: Int)? {

    print("Introduce row and col separed by a space: ", terminator:"")

    if let userInput = readLine(stripNewline: true) {

        var piecePlacemente = userInput.characters.split(" ").map(String.init)

        if piecePlacemente.count == 2 {
            let row = Int(piecePlacemente[0])!
            let col = Int(piecePlacemente[1])!

            if row > 2 || row < 0  ||  col > 2 || col < 0  {
                return nil
            }

            return (row,col)

        }

        else{
            print("BAD INPUT!!!")
        }
        
    }
    
    return nil
    
}

//
//  UserInterface.swift
//  TikTakToe
//
//  Created by Raul Ferreira on 3/17/16.
//  Copyright © 2016 FCUP. All rights reserved.
//

import Foundation

func readPositionsFromUser() -> (row: Int,col: Int)? {

    print("Introduce row and col separed by a space: ", terminator:"")

    if let userInput = readLine(stripNewline: true) {

        var piecePlacemente = userInput.characters.split(" ").map(String.init)

        if piecePlacemente.count == 2 {
            let row = Int(piecePlacemente[0])!
            let col = Int(piecePlacemente[1])!

            if (row > 2 ) || ( col > 2 ) {
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

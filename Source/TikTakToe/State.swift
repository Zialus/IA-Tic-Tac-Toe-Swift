//
//  State.swift
//  TikTakToe
//
//  Created by Raul Ferreira on 3/17/16.
//  Copyright © 2016 FCUP. All rights reserved.
//

import Foundation

class State {
    var table: [[Character]]
    let depth: Int
    let utility: Int
    var value: Int?

    init(table: [[Character]],  depth: Int, utility: Int) {
        self.table = table
        self.depth = depth
        self.utility = utility
        self.value = nil
    }

    func prettyPrint() {
        print("+---+---+---+")
        for i in 0..<3 {
            print("|", terminator:"")
            for j in 0..<2 {
                print(" \(table[i][j]) |",terminator:"")
            }
            print(" \(table[i][2])", terminator: " |\n")
            print("+---+---+---+")
        }
    }
}


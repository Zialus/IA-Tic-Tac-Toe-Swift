import Foundation

func whoWon(_ char: Character) -> String {

    switch char {
    case "O":
        if humanSymbol == "O"{
            return "You win!"
        } else {
            return "The Computer won!"
        }
    case "X":
        if humanSymbol == "X"{
            return "You win!"
        } else {
            return "The Computer won!"
        }
    default:
        return "Something weird happend :S"
    }

}

func checkWinner(_ gameTable: [[Character]]) -> (Bool, Character) {

    let rowWinner = checkRows(gameTable)
    if rowWinner != " " {
        return (true, rowWinner)
    }

    let colWinner = checkCols(gameTable)
    if colWinner != " " {
        return (true, colWinner)
    }

    let mdWinner = checkMainDiagonal(gameTable)
    if mdWinner != " " {
        return (true, mdWinner)
    }

    let sdWinner = checkSecondaryDiagonal(gameTable)
    if sdWinner != " " {
        return (true, sdWinner)
    }

    return (false, " ")
}

func checkRows(_ table: [[Character]]) -> Character {
    for row in 0..<3 {
        let condition1 = table[row][0] == table[row][1]
        let condition2 = table[row][1] == table[row][2]
        let condition3 = table[row][0] != " "
        if condition1 && condition2 && condition3 {
            return table[row][0]
        }
    }
    return " "
}

func checkCols(_ table: [[Character]]) -> Character {
    for col in 0..<3 {
        let condition1 = table[0][col] == table[1][col]
        let condition2 = table[1][col] == table[2][col]
        let condition3 = table[0][col] != " "
        if condition1 && condition2 && condition3 {
            return table[0][col]
        }
    }
    return " "
}

func checkMainDiagonal(_ table: [[Character]]) -> Character {
    if table[0][0] == table[1][1] && table[1][1] == table[2][2] {
        return table[1][1]
    }
    return " "
}

func checkSecondaryDiagonal(_ table: [[Character]] ) -> Character {
    if table[0][2] == table[1][1] && table[1][1] == table[2][0] {
        return table[1][1]
    }
    return " "
}

// Checks if the Game Table is fully occupied
func isFull(_ table: [[Character]]) -> Bool {

    for i in 0..<3 {
        for j in 0..<3 {
            if table[i][j] == " " {
                return false
            }
        }
    }

    return true
}

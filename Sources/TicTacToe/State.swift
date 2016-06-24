import Foundation

class State {
    let table: [[Character]]
    let depth: Int
    let utility: Int
    var value: Int
    var successors: [State]?

    init(table: [[Character]], depth: Int, utility: Int) {
        self.table = table
        self.depth = depth
        self.utility = utility
        self.value = -999
        self.successors = nil
    }

    func prettyPrint() {
        print("+---+---+---+")
        for i in 0..<3 {
            print("|", terminator:"")
            for j in 0..<2 {
                print(" \(table[i][j]) |", terminator:"")
            }
            print(" \(table[i][2])", terminator: " |\n")
            print("+---+---+---+")
        }
    }
}

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
        for i in 0..<3 {
            print("+---+---+---+")
            for j in 0..<3 {
                print("| \(table[i][j]) ", terminator:"")
            }
            print("|")
        }
        print("+---+---+---+")
    }

}

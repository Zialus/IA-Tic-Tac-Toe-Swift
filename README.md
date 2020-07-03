# Tic-Tac-Toe-Swift

A `swift` implementation of Tic-Tac-Toe.

[![Swift][swift-badge]][swift-url]
[![Platform][platform-badge]][platform-url]

[![Quality Gate Status][sonar-badge]][sonar-url]
[![Travis][travis-badge]][travis-url]

[swift-badge]: https://img.shields.io/badge/Swift-5.2-orange.svg?style=flat
[swift-url]: https://swift.org
[platform-badge]: https://img.shields.io/badge/Platforms-macOS%20--%20Linux-blue.svg?style=flat
[platform-url]: https://swift.org
[travis-badge]: https://travis-ci.org/Zialus/IA-Tic-Tac-Toe-Swift.svg?branch=master
[travis-url]: https://travis-ci.org/Zialus/IA-Tic-Tac-Toe-Swift
[sonar-badge]: https://sonarcloud.io/api/project_badges/measure?project=Zialus_IA-Tic-Tac-Toe-Swift&metric=alert_status
[sonar-url]: https://sonarcloud.io/dashboard?id=Zialus_IA-Tic-Tac-Toe-Swift

The decision making process for the computer moves is taken care by a
straightforward `MiniMax` (with and without `Alpha-Beta Pruning`)
implementation.

You can also choose to let the computer pick a position at random, otherwise it will never loose :smiley: .

## Instructions

### How to compile the Tic-Tac-Toe program

To compile just use the provided Makefile by running the command:

``` bash
make
```

on the terminal

### How to run

``` bash
./TicTacToe
```

For additional debug functionality you can run the program with one of the
following parameters:

-   `debug`
-   `fulldebug`

**For example:**

``` bash
./TicTacToe debug
```

### How to "play"

The program will ask the player to pick his preferred symbol and will also
let the player choose who plays first.

When the game gets going the player will be asked to input the row and column
to place his symbol.

The coordinates are represented in the following format :

``` text
+++++++++++++++++++
| 0,0 | 0,1 | 0,2 |
+++++++++++++++++++
| 1,0 | 1,1 | 1,2 |
+++++++++++++++++++
| 2,0 | 2,1 | 2,2 |
+++++++++++++++++++
```

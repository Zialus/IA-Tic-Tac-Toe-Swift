# Tic-Tac-Toe-Swift

A `swift` implementation of Tic-Tac-Toe.

The decision making process for the computer moves is taken care by a
straightforward `MiniMax` (with and without `Alpha-Beta Pruning`)
implementation.

This program was tested on `Fedora 23` and `Ubuntu 14.04` with `swift 2.2`

## Instructions for Fedora 23

### How to install swift (and its dependencies)

``` bash
curl https://github.com/Zialus/swift-rpm/releases/download/swift-3.0-DEVELOPMENTSNAPSHOT20160301a/swift-3.0-DEVELOPMENTSNAPSHOT20160301a.x86_64.rpm -O -L
sudo dnf install libbsd python libicu clang
sudo rpm -Uvh swift-3.0-DEVELOPMENTSNAPSHOT20160301a.x86_64.rpm
```

## Instructions for Ubuntu 14.04

### How to install swift (and its dependencies)

```bash
sudo apt-get install clang-3.6
sudo update-alternatives --install /usr/bin/clang clang /usr/bin/clang-3.6 100
sudo update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-3.6 100

wget -qO- http://dev.iachieved.it/iachievedit.gpg.key | sudo apt-key add -
echo "deb http://iachievedit-repos.s3.amazonaws.com/ trusty main" | sudo tee --append /etc/apt/sources.list
sudo apt-get update
sudo apt-get install swift-2.2
```

## General Instructions

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

For aditional debug functionality you can run the program with one of the
following paremeters:

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

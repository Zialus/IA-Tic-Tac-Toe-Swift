all:
	swift build -c release -Xswiftc -O
	mv ./.build/release/TicTacToe .

clean:
	swift package clean
	if [ -f ./TicTacToe ]; then rm ./TicTacToe; fi

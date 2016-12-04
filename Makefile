all:
	swift build -c release -Xswiftc -O
	mv ./.build/release/TicTacToe .

clean:
	swift build --clean
	if [ -f ./TicTacToe ]; then rm ./TicTacToe; fi

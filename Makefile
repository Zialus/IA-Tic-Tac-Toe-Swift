all:
	swift build
	mv ./.build/debug/TicTacToe .

clean:
	if [ -f ./TicTacToe ]; then rm ./TicTacToe; fi
	if [ -d ./.build/ ]; then rm -rf ./.build/; fi

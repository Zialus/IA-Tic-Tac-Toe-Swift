all:
	swift build -c release -Xswiftc -O
	mv ./.build/release/TicTacToe .

clean:
	if [ -f ./TicTacToe ]; then rm ./TicTacToe; fi
	if [ -d ./.build/ ]; then rm -rf ./.build/; fi

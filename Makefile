all:
	swift build -Xswiftc -O -c release
	mv ./.build/release/TicTacToe .

clean:
	swift package clean
	if [ -f ./TicTacToe ]; then rm ./TicTacToe; fi

test:
	./TicTacToe < ./Input/example.txt

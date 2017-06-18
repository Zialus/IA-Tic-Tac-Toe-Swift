DEBUGMODE = debug
EXEC = TicTacToe

all:
	swift build -Xswiftc -O -Xswiftc -wmo -c release
	cp ./.build/release/$(EXEC) .

clean:
	swift package clean
	if [ -f ./$(EXEC) ]; then rm ./$(EXEC); fi

test:
	./$(EXEC) $(DEBUGMODE) < ./Input/example.txt

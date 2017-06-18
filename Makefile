DEBUGMODE = debug
EXEC = TicTacToe

all:
	swift build -Xswiftc -O -Xswiftc -wmo -c release
	cp ./.build/release/$(EXEC) .

clean:
	swift package clean
	if [ -f ./$(EXEC) ]; then rm ./$(EXEC); fi

test: player_first computer_first player_first_AB computer_first_AB

player_first:
	./$(EXEC) $(DEBUGMODE) < ./Input/player_first.txt

computer_first:
	./$(EXEC) $(DEBUGMODE) < ./Input/computer_first.txt

player_first_AB:
	./$(EXEC) $(DEBUGMODE) < ./Input/player_first_AB.txt

computer_first_AB:
	./$(EXEC) $(DEBUGMODE) < ./Input/computer_first_AB.txt

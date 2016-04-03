all:
	swift build
	mv ./.build/debug/TikTakToe .

clean:
	if [ -f ./TikTakToe ]; then
		rm ./TikTakToe
	fi

	if [ -d ./.build/ ]; then
		rm -rf ./.build/
	fi
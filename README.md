# The Odin Project Assignment: ["Build a Hangman Game in Ruby"](https://www.theodinproject.com/courses/ruby-programming/lessons/file-i-o-and-serialization)

Hangman is a paper and pencil guessing game for two or more players. One player thinks of a word, phrase or sentence and the other tries to guess it by suggesting letters or numbers, within a certain number of guesses. Please see [Wikipedia article](https://en.wikipedia.org/wiki/Hangman_(game)) for extended info.

## Installation

Save Hangman folder in your chosen location

And then inside of it execute:

    $ bundle

## Usage

To play the game run:

    ruby Hangman-game\run_game\play.rb

## How to Play

At the start of the game please state your name

After that, you can choose to load a saved game. There is one available instant of the game where you can check almost fully answered the puzzle. Only one letter is missing and it is letter "d"

Regardless of your choice, you are now able to guess next letter of the given password. All letters in the password are small_case letters. Originally you are given 12 guesses to find out the password. If you've loaded the old game you are probably having an even smaller number of options.

After guessing the letter, you are asked if you would like to save the game. You can do this by inputting "y" on the console.

Then you can also try to answer the riddle right in that moment but be aware that if unlucky, you will hang.. (This feature is buggy right now!!)

If you guess all the letters correctly you win and you can live.. for now!

## Still in developement stage!!

Game should recognize if you are trying to use character you've already proposed earlier. Right now you can guess "e" 12 times.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

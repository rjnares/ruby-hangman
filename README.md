# Ruby Hangman

This is my implementation of the [Hangman](https://www.theodinproject.com/lessons/ruby-hangman) project assigned in the [Files and Serialization](https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby#files-and-serialization) section of the [Ruby](https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby) course which is part of the [Full Stack Ruby on Rails](https://www.theodinproject.com/paths/full-stack-ruby-on-rails) curriculum from [The Odin Project](https://www.theodinproject.com/).

## Project Description

This Ruby application is a command line version of the classic hangman game. The player will guess a letter every turn until they make 7 incorrect guesses or they guess every letter in the secret word. Each turn, the player will also have the option to save the current game state to a local yaml file. When the application first runs, it will give the player the option to start a new game or load a saved game state to continue playing where they left off.

## Skills Applied

The goal of this project was to apply the concepts taught in the [Files and Serialization](https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby#files-and-serialization) section of the [Ruby](https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby) course. There are many ways in which these concepts could be applied on a practical project such as this, but my implementation did so in the following manner:
* Using the `File` and `Dir` classes to check if a given file or directory exists
* Using the `File` class to open, read, or write local files such as the `google-10000-english-no-swears.txt` word bank file and the saved game files under the `game_saves` directory
* Using the `YAML` module to serialize `Game` object data into a yaml string
* Using the `YAML` module to deserialize a yaml string into data used to instantiate a `Game` object

## Live View

Click [here](https://replit.com/@robertonares/ruby-hangman) to open this project on [Replit](https://replit.com/) and click the `Run` button to run the application.
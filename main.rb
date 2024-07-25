# frozen_string_literal: true

require_relative 'lib/game'

puts 'Please type a valid game save file name to load a previous game state'
puts "For example: 'game_saves/hangman 2024-07-25 12:20:29.yaml'"
puts 'Note: if a valid game save file is not found, a new game will be started by default'
puts
print 'File name: '
game = Game.load_game(gets.chomp.downcase)
game.play

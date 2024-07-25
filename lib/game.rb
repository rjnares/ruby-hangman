# frozen_string_literal: true

require_relative 'host'
require_relative 'game_io'

# Game class
class Game
  include GameIO

  def initialize
    @host = Host.new
    @secret_word_array = @host.choose_random_word.split('')
    @secret_word_progress_array = Array.new(@secret_word_array.length, '_')
    @incorrect_letters = []
    @incorrect_guesses_left = 7
  end

  def play
    letter = next_letter(@secret_word_progress_array, @incorrect_letters, @incorrect_guesses_left)
    p letter
  end
end

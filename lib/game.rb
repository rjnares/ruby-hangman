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
    while @incorrect_guesses_left.positive?
      letter = next_letter(@secret_word_progress_array, @incorrect_letters, @incorrect_guesses_left)

      update_game_state(letter)

      if word_guessed?
        game_win
        return
      end

      game_lose if @incorrect_guesses_left.zero?
    end
  end

  private

  def word_guessed?
    @secret_word_array == @secret_word_progress_array
  end

  def update_game_state(letter)
    if correct_letter?(letter)
      update_progress(letter)
    else
      update_incorrect(letter)
    end
  end

  def correct_letter?(letter)
    @secret_word_array.include?(letter)
  end

  def update_progress(new_letter)
    @secret_word_array.each_with_index do |letter, index|
      @secret_word_progress_array[index] = letter if letter == new_letter
    end
  end

  def update_incorrect(letter)
    @incorrect_letters << letter
    @incorrect_guesses_left -= 1
  end
end

# frozen_string_literal: true

require_relative 'game_io'

# Game class
class Game
  include GameIO

  def initialize
    @secret_word_array = choose_random_word.split('')
    @secret_word_progress_array = Array.new(@secret_word_array.length, '_')
    @incorrect_letters = []
    @incorrect_guesses_left = 7
  end

  def play
    while @incorrect_guesses_left.positive?
      letter = next_letter(@secret_word_progress_array, @incorrect_letters, @incorrect_guesses_left)

      update_game_state(letter)

      if word_guessed?
        game_win(@secret_word_array.join)
        return
      end

      game_lose(@secret_word_array.join) if @incorrect_guesses_left.zero?
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

  def choose_random_word
    word_bank = []
    file = File.open('google-10000-english-no-swears.txt')
    until file.eof?
      line = file.gets.chomp
      word_bank << line if line.length.between?(5, 12)
    end
    file.close
    word_bank.sample
  end
end

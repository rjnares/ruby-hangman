# frozen_string_literal: true

# Game I/O module
module GameIO
  def next_guess
    print 'Next guess: '
    gets.chomp.downcase
  end

  def display_turn_text(word_progress_array, incorrect_letters, incorrect_guesses_left)
    puts
    puts "Word to guess: #{word_progress_array.join(' ')}"
    puts "Incorrect letters: #{incorrect_letters.join(' ')}"
    puts "Incorrect guesses left: #{incorrect_guesses_left}"
    puts
  end

  def invalid_input_warning
    puts 'All guesses must be a single english letter...please try again'
    puts
  end

  def previous_guess_warning(guess)
    puts "The letter '#{guess}' has already been guessed...please try again"
    puts
  end

  def next_letter(word_progress_array, incorrect_letters, incorrect_guesses_left)
    display_turn_text(word_progress_array, incorrect_letters, incorrect_guesses_left)
    next_guess_loop(word_progress_array, incorrect_letters)
  end

  def next_guess_loop(word_progress_array, incorrect_letters)
    loop do
      guess = next_guess
      if invalid_input?(guess)
        invalid_input_warning
      elsif previous_guess?(guess, incorrect_letters, word_progress_array)
        previous_guess_warning(guess)
      else
        return guess
      end
    end
  end

  def invalid_input?(input)
    !(input.length == 1 && input.between?('a', 'z'))
  end

  def previous_guess?(letter, incorrect_letters, word_progress_array)
    incorrect_letters.include?(letter) || word_progress_array.include?(letter)
  end

  def game_lose(secret_word)
    puts "You have run out of guesses...the secret word was '#{secret_word}'"
    puts 'Game over, you lose!'
    puts
  end

  def game_win(secret_word)
    puts "You have guessed the secret word '#{secret_word}'"
    puts 'Game over, you win!'
    puts
  end
end

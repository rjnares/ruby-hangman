# frozen_string_literal: true

# Game I/O module
module GameIO
  def input_prompt
    print "Type a single english letter for your next guess or 'save' to save the current game: "
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

  def next_input(word_progress_array, incorrect_letters, incorrect_guesses_left)
    display_turn_text(word_progress_array, incorrect_letters, incorrect_guesses_left)
    next_input_loop(word_progress_array, incorrect_letters)
  end

  def next_input_loop(word_progress_array, incorrect_letters)
    loop do
      input = input_prompt
      if invalid_input?(input)
        invalid_input_warning
      elsif previous_guess?(input, incorrect_letters, word_progress_array)
        previous_guess_warning(input)
      else
        return input
      end
    end
  end

  def invalid_input?(input)
    !(input == 'save' || input.length == 1 && input.between?('a', 'z'))
  end

  def previous_guess?(input, incorrect_letters, word_progress_array)
    incorrect_letters.include?(input) || word_progress_array.include?(input)
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

  def game_saved(file)
    puts "Your current game state has been saved to '#{file}'"
    puts 'Continuing current game...'
  end
end

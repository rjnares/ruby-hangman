# frozen_string_literal: true

require_relative 'host'

# Game class
class Game
  def initialize
    @host = Host.new
    @secret_word_array = @host.choose_random_word.split('')
    @secret_word_progress_array = Array.new(@secret_word_array.length, '_')
  end

  def play
    puts 'Game is being played'
  end
end

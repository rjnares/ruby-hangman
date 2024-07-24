# frozen_string_literal: true

require_relative 'host'

# Game class
class Game
  def initialize
    @host = Host.new
  end

  def play
    puts 'Game is being played'
  end
end

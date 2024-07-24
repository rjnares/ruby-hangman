# frozen_string_literal: true

# Host class
class Host
  def initialize
    @secret_word_array = choose_random_word.split('')
    @secret_word_progress_array = Array.new(@secret_word_array.size, '_')
  end

  private

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

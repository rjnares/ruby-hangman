# frozen_string_literal: true

# Host class
class Host
  def initialize
    @secret_word = choose_random_word
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

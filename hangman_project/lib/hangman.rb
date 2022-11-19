require "byebug"
class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  def self.random_word 
    DICTIONARY.sample()
  end

  #PART 1
  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, "_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    @attempted_chars.include?(char)
  end

  def get_matching_indices(char)
    new_array = []
    @secret_word.each_char.with_index{ |c, i | new_array << i if c == char}
    new_array
  end

  def fill_indices(char, array)
    array.each {|i| @guess_word[i] = char}
  end

  #PART 2
  def try_guess(char)
    if already_attempted?(char) 
      puts "that has already been attempted"
      return false
    end
    @attempted_chars << char
    @remaining_incorrect_guesses -= 1 if !@secret_word.include?(char)
    self.fill_indices(char, self.get_matching_indices(char))
    true
  end

  def ask_user_for_guess
    p "Enter a char"
    char = gets.chomp
    self.try_guess(char)
  end

  def win?
    if @guess_word.join == @secret_word
      puts "WIN" 
      return true
    end
    false
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      puts "LOSE"
      return true
    end
    false
  end

  def game_over?
    if self.win? || self.lose? 
      puts @secret_word
      return true
    end
    false
  end
end

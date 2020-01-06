class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
    
  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length,"_")
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
    attempted_chars.include?(char)
  end

  def get_matching_indices(character)
    array = []
    if @secret_word.include?(character)
      checking = @secret_word.split("")
      checking.each_with_index do |char,index|
        if char == character
          array << index
        end
      end
    end
    array
  end

  def fill_indices(char,array)
    array.each {|ele| @guess_word[ele] = char}
  end

  def try_guess(guessed_char)
     #does the char has no match indices in @secret_word
    if self.get_matching_indices(guessed_char).empty?
      @remaining_incorrect_guesses -= 1
    else
      #which indexes in array 
      which_index = self.get_matching_indices(guessed_char)
      #fill indexes with guessed char
      self.fill_indices(guessed_char,which_index)
    end

    if self.already_attempted?(guessed_char)
      p "that has already beed attempted"
      return false
    else
      @attempted_chars << guessed_char
      return true
    end
  end

  def ask_user_for_guess
    p "Enter a char: "
    char = gets.chomp
    self.try_guess(char)
  end

  def win?
    if @guess_word.join("") == @secret_word
      print "WIN "
      return true
    else
      return false
    end
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      print "LOSE "
      return true
    else
      return false
    end
  end

  def game_over?
    if win? || lose?
      p @secret_word
      return true
    else
      return false
    end
  end
  
end

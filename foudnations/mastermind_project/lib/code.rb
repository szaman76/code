class Code

  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  #getter
  attr_reader :pegs
  #setter
  attr_writer
  #both
  attr_accessor 

  def self.valid_pegs?(array)
    array.all? {|char| POSSIBLE_PEGS.has_key?(char.upcase)}
  end

  #class methods
  def self.random(length)
    random_pegs = []
    length.times {random_pegs << POSSIBLE_PEGS.keys.sample}
    Code.new(random_pegs)
  end

  def self.from_string(string)
     Code.new(string.split(""))
  end

  #instance methods
  def initialize(array)
    if Code.valid_pegs?(array)
      @pegs = array.map(&:upcase)
    else
      raise_exception
    end
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(guess)
  count = 0
    (0...guess.length).each do |i|
      count += 1 if guess[i] == self[i]
    end
  count
  end

  def num_near_matches(guess)
    count = 0
    (0...guess.length).each do |i|
      if guess[i] != self[i] && self.pegs.include?(guess[i])
        count += 1
      end
    end
    count
  end

  def ==(other_code)
    self.pegs == other_code.pegs
  end







end

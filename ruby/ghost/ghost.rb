require 'set'
require_relative "player"

class Game
    ALPHABET = Set.new("a".."z")
    #MAX_LOSS_COUNT = 5

    attr_reader :dictionary, :fragment, :player_2, :player_1
    attr_writer :fragment

    def initialize(player_1, player_2)
        words = File.readlines("dictionary.txt").map(&:chomp)
        @dictionary = Set.new(words)
        @player_1 = player_1
        @player_2 = player_2
        # @losses = Hash.new { |losses, player| losses[player] = 0 }
        @fragment = ""
    end


    # def play_round
    #     @fragment = ""
    # end

    
    def add_letter(letter)
        @fragment << letter
    end 

    def valid_play?(letter)
        return false unless ALPHABET.include?(letter)

        new_fragment = @fragment + letter
        dictionary.any? {|word| word.start_with?(new_fragment)}
    end

    def valid_word?(word)
        @dictionary.include?(word)
    end

    def lose_round?
        valid_word?(word)
    end

    def current_player
        @player_1
    end
    
    def previous_player
        if current_player == @player_1
            @player_2
        else
            @player_1
        end
    end

    def next_player!
        
    end
    
    def take_turn(player)
        letter = gets.chomp
        if valid_play(letter)

        else
            
        end
    end


end
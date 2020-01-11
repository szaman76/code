require 'set'
require_relative "player"

class Game
    ALPHABET = Set.new("a".."z")
    MAX_LOSS_COUNT = 5

    def initialize(*players)
        words = File.readlines("dictionary.txt").map(&:chomp)
        @dictionary = Set.new(words)
        @players = players
        @losses = Hash.new { |losses, player| losses[player] = 0 }
    end


    def play_round
        @fragment = ""
    end

    def add_letter(letter)
        if valid?(@fragment + letter)
            @fragment += letter
        else
            raise "not valid word"
        end
    end 

    
    def valid_word?(word)
        @dictionary.include?(word)
    end

    def lose_round?
        valid_word?(word)
    end

    def current_player
        players.first
    end
    
    def previous_player
        if current_player == players.first
            players.last
        else
            players.first
        end
    end

    def next_player!
        
    end


end
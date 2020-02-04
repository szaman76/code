require "byebug"
require "set"
require_relative "player"

class GhostGame
    ALPHABET = Set.new("a".."z")
    MAX_LOSS_COUNT = 5

    def initialize(*players)
        words = File.readlines("dictionary.txt").map(&:chomp)
        @dictionary = Set.new(words)
        @players = players
        @losses = Hash.new { |losses,player| losses[player] = 0 }
    end

    def run
        play_round until game_over?
        puts "#{winner} wins"
    end

    #private
    attr_reader :dictionary, :fragment, :losses, :players


    def game_over?
        remaining_players == 1
    end


    def play_round
        @fragment = ""
        welcome
        until round_over?
            take_turn
            next_player!
        end

        update_standings
    end

    def winner
        (player, _) = losses.find { |_, losses| losses < MAX_LOSS_COUNT }
        player
    end

    def remaining_players
        losses.count { |_, v| v < MAX_LOSS_COUNT }
    end

    def record(player)
        count = losses[player]
        "GHOST".slice(0,count)
    end

    def add_letter(letter)
        fragment << letter
    end

    def current_player
        @players.first
    end

    def previous_player
        if current_player == @players[0]
            return @players[1]
        else
            return @players[0]
        end
    end

    def next_player!
        @players.rotate!
    end

    def is_word?(fragment)
        @dictionary.include?(fragment)
    end

    def round_over?
        is_word?(fragment)
    end

    def valid_play?(letter)
        return false unless ALPHABET.include?(letter)
        potential_fragment = fragment + letter
        dictionary.any? {|word| word.start_with?(potential_fragment) }
    end

    def welcome
        system("clear")
        puts "Let's play a round of Ghost!"
        display_standings
    end

    def display_standings
        puts "Current standings:"
    
        players.each do |player|
          puts "#{player}: #{record(player)}"
        end
    
        sleep(2)
    end

    def update_standings
        system("clear")
        puts "#{previous_player} spelled #{fragment}."
        puts "#{previous_player} gets a letter!"
        sleep(1)
    
        if losses[previous_player] == MAX_LOSS_COUNT - 1
          puts "#{previous_player} has been eliminated!"
          sleep(1)
        end
        
        losses[previous_player] += 1
        
        display_standings
    end

    def take_turn
        system("clear")
        puts "It's #{current_player}'s turn!"
        letter = nil

        until letter
            letter = current_player.guess(fragment)

            unless valid_play?(letter)
                current_player.alert_invalid_guess(letter)
                letter = nil
            end
        end
        add_letter(letter)
        puts "#{current_player} added the letter '#{letter}' to the fragment."
    end
end

if $PROGRAM_NAME == __FILE__
    game = GhostGame.new(
      Player.new("Michal"), 
      Player.new("Agata"),
      )
  
    game.run
end
  
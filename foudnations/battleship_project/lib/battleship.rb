require_relative "board"
require_relative "player"



class Battleship
    attr_reader :board, :player


    def initialize(n)
        @player = Player.new
        @board = Board.new(n)
        @remaining_misses = @board.size * 0.5
    end

    def start_game
        @board.place_random_ships
        print "Number of ships: #{@board.num_ships}"
        @board.print
    end

    def lose?
        if @remaining_misses <= 0
            print "you lose"
            return true
        else
            return false
        end
    end

    def win?
        if @board.num_ships == 0
            print "you win"
            return true
        end
        return false
    end

    def game_over?
        if self.win? || self.lose?
            return true
        end
        return false
    end

    def turn
        move = @player.get_move
        if !@board.attack(move)
            @remaining_misses -= 1 
        end
        @board.print
        print @remaining_misses
    end


end

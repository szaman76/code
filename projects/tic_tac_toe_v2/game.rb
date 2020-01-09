require_relative "board"
require_relative "human_player"

class Game
    attr_reader :current_player


    def initialize(n, *marks)
        @players = marks.map {|mark| HumanPlayer.new(mark)}
        @board = Board.new(n)
        @current_player = @players.first
    end

    def switch_turn
        @current_player = @players.rotate![0]
    end

    def game

        while @board.empty_positions?
            position = @current_player.get_position
            while !@board.place_mark(position,@current_player.mark)
                    position = @current_player.get_position
                end
            if @board.win?(@current_player.mark)
                puts 'Game Over'
                puts @current_player.mark.to_s + ' HAS WON!'
                return
            else
                self.switch_turn
            end
        end
        puts 'Game Over'
        puts "draw"

    end

end


require_relative "board"
require_relative "human_player"

class Game
    attr_reader :current_player


    def initialize(player_1_mark, player_2_mark)
        @player_1 = HumanPlayer.new(player_1_mark)
        @player_2 = HumanPlayer.new(player_2_mark)
        @board = Board.new
        @current_player = @player_1
    end

    def switch_turn
        if @current_player == @player_1
            @current_player = @player_2
            true
        else
            @current_player = @player_1
            true
        end
    end

    def game

        while @board.empty_positions?
            position = @current_player.get_position
            @board.place_mark(position,@current_player.mark)
            if @board.win?(@current_player.mark)
                return
            else
                self.switch_turn
            end
        end

        puts "draw"
        true
    end

end
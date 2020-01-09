require_relative "board"
require_relative "human_player"
require_relative "computer_player"
class Game
    attr_reader :current_player


    def initialize(n, players)
        @players = players.map do |mark, is_comp|
            is_comp ? ComputerPlayer.new(mark) : HumanPlayer.new(mark)
        end
        @board = Board.new(n)
        @current_player = @players.first
    end

    def switch_turn
        @current_player = @players.rotate![0]
    end

    def game
        while @board.empty_positions?
            @board.print
            choices = @board.legal_positions
            pos = @current_player.get_position(choices)
            @board.place_mark(pos, @current_player.mark)
            if @board.win?(@current_player.mark)
                puts 'Game Over'
                puts @current_player.mark.to_s + ' HAS WON!'
                return
            else
                switch_turn
            end
        end

        puts 'Game Over'
        puts "draw"

    end

end

# pry
# load 'game.rb'
# machine_civil_war = Game.new(10, h: true, u: true, e: true)
# machine_civil_war.play

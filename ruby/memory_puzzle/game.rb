require_relative 'card'
require_relative 'board'

class Game

    def initialize(player, size = 4)
        @board = Board.new(size)
        @prev_position = nil
        @player = player
    end


    def get_player_input
        pos = nil

        until pos && valid_pos?(pos)
            pos = gets.chomp
        end
        pos

    end

    def make_guess(card)
        revealed_value = board.reveal(pos)
    player.receive_revealed_card(pos, revealed_value)
    board.render
    sleep(1)
    end


    def play
        until @board.won?
            @board.render
            guess = get_player_input
            make_guess(guess)
        end

    end


    def valid_pos?(pos)
        pos.is_a?(Array) && pos.count == 2 && pos.all? {|x| x.between?(0,board.size - 1)}

    end

end
class ComputerPlayer

    attr_reader :mark

    def initialize(mark)
        @mark = mark
    end
    
    def get_position(legal_position)
        puts "enter the position as two numbers [row, col]"
        puts "You are playing with #{@mark}"
        pos = legal_position.sample
        #pos = gets.chomp.split(" ").map(&:to_i)
        #raise 'sorry, that was invalid :(' if pos.length != 2
        pos
    end

end
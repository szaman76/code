class HumanPlayer

    attr_reader :mark

    def initialize(mark)
        @mark = mark

    end

    def get_position
        puts "enter the position as two numbers [row, col]"
        puts "You are playing with #{@mark}"
        pos = gets.chomp

        if ("a".."z").include?(pos[0]) || ("a".."z").include?(pos[2]) 
            p "please put numbers"
            self.get_position
            return false
        end
        if pos.length != 3
            p "wrong positions put two numbers with space in between"
            self.get_position
            return false
        end
        if !(0..2).include?(pos[0].to_i) || !(0..2).include?(pos[2].to_i)
            p "please put numbers in between 0 and 2"
            self.get_position
            return false
        end
        true
        return [pos[0].to_i,pos[2].to_i]
    end

end


# b = HumanPlayer.new("X")

# p b.get_position
# #p b.mark_value
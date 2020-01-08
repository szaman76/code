class Board

    attr_reader :grid

    def initialize
        @grid = Array.new(3) {Array.new(3,'_')}
    end

    #if @grid[1,1] is valid return true
    def valid?(pos)
        return false if pos[0] < 0 || pos[1] < 0
        @grid[pos[0]][pos[1]] != nil
    end
    # if @grid [1,1] == '_' return true
    def empty?(pos)
        @grid[pos[0]][pos[1]] == '_'
    end

    def place_mark(pos,mark)
        return "Error: pos is invalid" if !self.valid?(pos) || !self.empty?(pos)
        @grid[pos[0]][pos[1]] = mark
    end
    
    def print
        @grid.each do |row|
            p row
            puts "\n"
        end
    end

    def win_row?(mark)
        @grid.each do |row|
            if row.all? {|word| word == mark}
                p "Player #{mark} won with rows"
                p "Player #{mark} is a winner"
                return true
            end
        end
        false
    end

    def win_col?(mark)
        @grid.transpose.each do |col|
            if col.all? {|word| word == mark}
                p "Player #{mark} won with collumns"
                p "Player #{mark} is a winner"
                return true
            end
        end
        false
    end

    def win_diagonal?(mark)
        len = @grid.length - 1
        #base = @grid[0][0]
        #second_base = array[0][len]

        (0..len).each do |i|
            if mark != @grid[i][i] && mark != @grid[i][-i - 1]
                return false
            end
        end
        p "Player #{mark} won diagonal"
        p "Player #{mark} is a winner"
        true
    end

    def win?(mark)
        if win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
            return true 
        end
    end

    def empty_positions?
        @grid.each do |row|
            row.each do |ele|
                if ele == "_"
                    p "grid has empty pos"
                    self.print
                    return true
                end
            end
        end
        false
    end

end
# ["_", "_", "_"]

# ["_", "X", "_"]

# ["_", "_", "O"]
# tik = Board.new
# tik.place_mark([0,0],"X")
# tik.place_mark([0,1],"O")
# tik.place_mark([0,2],"O")
# tik.place_mark([1,0],"X")
# tik.place_mark([1,1],"O")
# tik.place_mark([1,2],"O")
# tik.place_mark([2,0],"O")
# #tik.place_mark([2,1],"X")
# tik.place_mark([2,2],"X")
# tik.print

# p tik.win_row?("O")
# p tik.win_col?("O")
# p tik.win_diagonal?("O")
# p tik.win?("O")
# p tik.empty_positions?
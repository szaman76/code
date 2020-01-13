require_relative 'card'

class Board

    attr_reader :size

    def initialize(size = 4)
        @grid = Array.new(size) {Array.new(size)}
        @size = size
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(pos,value)
        row, col = pos
        @grid[row][col] = value
    end

    def hide(pos)
        self[pos].hide
    end

    def populate
        



    end

    def reveal(pos)
        if !self.revealed?
            self[pos].reveal
            return self[pos]
        end
    end

    def render
        @grid.each do |row|
            p row
        end
    end

    def won?
        @grid.flatten.all? {|el| el.revealed?}
    end
end
grid = [[1,2,3,4],[5,6,7,8],[9,10,11,12],[13,14,15,16]]
all = [1,2,3,4]
size = 4
grid = Array.new(size) {Array.new(size)}

def populate(asd)
    card_values = (0..7).to_a + (0..7).to_a
    card_values.shuffle!

    asd.map! do |row|
        row.map! do |ele|
            ele = card_values.pop
        end
    end
    p asd


end

p populate(grid)
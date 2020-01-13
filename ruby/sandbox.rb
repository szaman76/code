grid = [[1,2,3,4],[5,6,7,8],[9,10,11,12],[13,14,15,16]]
all = [1,2,3,4]
size = 4
grid = Array.new(size) {Array.new(size)}

def populate(asd)
    asd.map! do |row|
        row=*(1..row.length)
    end

end

p populate(grid)
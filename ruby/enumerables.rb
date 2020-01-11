class Array

    def my_each(&block)
        self.length.times do |i|
            block.call(self[i])
        end

        self
    end

    def my_select(&block)
        new_arr = []
        self.length.times do |i|
            if block.call(self[i])
                new_arr << i
            end
        end
        new_arr
    end

end

a = [1, 2, 3]
p a.my_select { |num| num > 1 } # => [2, 3]
p a.my_select { |num| num == 4 } # => []
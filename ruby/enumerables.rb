class Array

    def my_each(&block)
        self.length.times do |i|
            block.call(self[i])
        end

        self
    end

    def my_select(&block)
        

    end

end

return_value = [1, 2, 3].my_each do |num|
    puts num
  end.my_each do |num|
    puts num
end

puts ""

p return_value
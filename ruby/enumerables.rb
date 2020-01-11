require "byebug"
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
                    new_arr << self[i]
                end
            end
            new_arr
        end

        def my_reject(&block)
            new_arr = []
            self.length.times do |i|
                if !block.call(self[i])
                    new_arr << self[i]
                end
            end
            new_arr
        end

        def my_any?(&block)
            self.length.times do |i|
                if block.call(self[i])
                    return true
                end
            end
            false
        end 

        def my_all?(&block)
            debugger
            self.length.times do |i|
                if !block.call(self[i])
                    return false
                end
            end
            true
        end 


    end

a = [1, 2, 3]
p a.my_any? { |num| num > 1 } # => true
p a.my_any? { |num| num == 4 } # => false
p a.my_all? { |num| num > 1 } # => false
p a.my_all? { |num| num < 4 } # => true
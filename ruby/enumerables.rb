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
            self.length.times do |i|
                if !block.call(self[i])
                    return false
                end
            end
            true
        end 

        def my_flatten
            new_arr = []
                self.each do |el|
                    if el.is_a?(Array)
                        new_arr.concat(el.my_flatten)
                    else
                        new_arr << el
                    end
                end
            new_arr
        end

        def my_zip(*args)
            new_arr = []

            self.length.times do |i|
                sub_arr = [self[i]]

                args.each do |array|
                    sub_arr << array[i]
                end
                new_arr <<  sub_arr
            end
            new_arr
        end

        def my_rotate(count = 1)
            rotated = []
            swap = count % self.length
                rotated = self[swap..-1] + self[0...swap]
            rotated
        end

    end

a = [1, 2, 3]
[1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten
p a.my_any? { |num| num > 1 } # => true
p a.my_any? { |num| num == 4 } # => false
p a.my_all? { |num| num > 1 } # => false
p a.my_all? { |num| num < 4 } # => true
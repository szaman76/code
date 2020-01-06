# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    
    def span
        return nil if self.empty?
        self.max - self.min
    end

    def average
        return nil if self.empty?
        self.sum / self.length.to_f #to_float
    end

    def median
        return nil if self.empty?
        sorted = self.sort
        len = self.length
        if len % 2 == 1
            return sorted[len / 2]
        else
            medi = sorted[len/2 - 1] + sorted[len/2]
            return medi / 2.0
        end
    end

    def counts
        counter = Hash.new {|hasz,key| hasz[key] = 0}
        self.each do |ele|
            counter[ele] += 1
        end
        return counter
    end

    def my_count(arg)
        result = 0
        self.each do |ele|
            if ele == arg
                result += 1
            end
        end
        return result
    end

    def my_index(arg)
        self.each_with_index do |ele, idx|
            if ele == arg
                return idx
            end
        end
        return nil
    end

    def my_uniq
        new_array = []

        self.each do |ele|
            if !new_array.include?(ele)
                new_array << ele
            end
        end
        new_array
    end

    def my_transpose
        new_arr = []
        self.length.times do
            new_arr << []
        end
            self.each_with_index do |array,inde|
                array.each_with_index do |ele, idx|
                    new_arr[idx][inde] = ele
                end
            end
        return new_arr
    end
end

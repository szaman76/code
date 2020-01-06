# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.
require "byebug"

def largest_prime_factor(numer)
    i = numer
    while i >= 2
        if numer % i == 0 && prime?(i)
            return i
        end
        i -= 1
    end
end

def prime?(num)
    return false if num < 2
    (2...num).each do |i|
        if num % i == 0
            return false
        end
    end
    return true
end

def unique_chars?(string)
    i = 0
    while i <= string.length - 1
        j = i + 1
        while j < string.length
            if string[i] == string[j]
                return false
            end
            j += 1
        end
        i += 1
    end
    return true
end

def dupe_indices(array)
    obj = Hash.new {|h,k| h[k] = [] }
    array.each_with_index do |ele, idx|
       if array.count(ele) > 1
        obj[ele] += [idx]
       end
    end
    obj
end


def ana_array(arg_1,arg_2)

    return false if arg_1.length != arg_2.length

arg_2.each do |ele|
    if !arg_1.include?(ele)
        return false
    end
end
return true

end


p ana_array(["cat","dog","dog"],["dog","cat","cat"])
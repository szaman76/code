def proper_factors(number)
    new_arr = []

    (1...number).each do |num|
        if number % num == 0 
            new_arr << num
        end
    end
    new_arr
end

def aliquot_sum(number)
    return proper_factors(number).sum
end

def perfect_number?(number)
    return aliquot_sum(number) == number
end

def ideal_numbers(n)
    new_arr = []
    i = 6

    while new_arr.length < n
        if perfect_number?(i)
            new_arr << i
        end
    i += 1
    end
    new_arr
end

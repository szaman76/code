require "byebug"
# strange_sums
# Write a method strange_sums that accepts an array of numbers as an argument. 
# The method should return a count of the number of distinct pairs of elements that have a sum of zero. 
# You may assume that the input array contains unique elements.

# Examples
# p strange_sums([2, -3, 3, 4, -2])     # 2
# p strange_sums([42, 3, -1, -42])      # 1
# p strange_sums([-5, 5])               # 1
# p strange_sums([19, 6, -3, -20])      # 0
# p strange_sums([9])                   # 0

def strange_sums(array)
    len = array.length # 5
    count = 0
    (0...len - 1).each_with_index do |num,idx1|
        (0...len).each_with_index do |pair,idx2|
            if array[num] + array[pair] == 0 && idx2 > idx1
            count += 1 
            end
        end
    end
    count
end

# pair_product
# Write a method pair_product that accepts an array of numbers and a product as arguments. 
# The method should return a boolean indicating whether or not a pair of distinct elements in the array 
# result in the product when multiplied together. You may assume that the input array contains unique elements.

# Examples
# p pair_product([4, 2, 5, 8], 16)    # true
# p pair_product([8, 1, 9, 3], 8)     # true
# p pair_product([3, 4], 12)          # true
# p pair_product([3, 4, 6, 2, 5], 12) # true
# p pair_product([4, 2, 5, 7], 16)    # false
# p pair_product([8, 4, 9, 3], 8)     # false
# p pair_product([3], 12)             # false

def pair_product(array,check)
    len = array.length # 5
    (0...len - 1).each_with_index do |num,idx1|
        (0...len).each_with_index do |pair,idx2|
            if array[num] * array[pair] == check && idx2 > idx1
            return true
            end
        end
    end
    return false
end


# rampant_repeats
# Write a method rampant_repeats that accepts a string and a hash as arguments. 
# The method should return a new string where characters of the original string are repeated 
# the number of times specified by the hash. If a character does not exist as a key of the hash, 
# then it should remain unchanged.

# Examples
# p rampant_repeats('taco', {'a'=>3, 'c'=>2})             # 'taaacco'
# p rampant_repeats('feverish', {'e'=>2, 'f'=>4, 's'=>3}) # 'ffffeeveerisssh'
# p rampant_repeats('misispi', {'s'=>2, 'p'=>2})          # 'mississppi'
# p rampant_repeats('faarm', {'e'=>3, 'a'=>2})            # 'faaaarm'


def rampant_repeats(string,hash)
    arr = []
    string.each_char do |char|
        if hash.key?(char)
            arr << char * hash[char]
        else
            arr << char
        end
    end
    arr.join("  ")

end

# perfect_square?
# Write a method perfect_square? that accepts a number as an argument. 
# The method should return a boolean indicating whether or not the argument is a perfect square. 
# A perfect square is a number that is the product of some number multiplied by itself. 
# For example, since 64 = 8 * 8 and 144 = 12 * 12, 64 and 144 are perfect squares; 35 is not a perfect square.

# Examples
# p perfect_square?(1)     # true
# p perfect_square?(4)     # true
# p perfect_square?(64)    # true
# p perfect_square?(100)   # true
# p perfect_square?(169)   # true
# p perfect_square?(2)     # false
# p perfect_square?(40)    # false
# p perfect_square?(32)    # false
# p perfect_square?(50)    # false

def perfect_square?(num)
    (1..num).each do |el|
        return true if el * el == num
    end
    false
end

# anti_prime?
# Write a method anti_prime? that accepts a number as an argument. The method should return true 
# if the given number has more divisors than all positive numbers less than the given number. 
# For example, 24 is an anti-prime because it has more divisors than any positive number less than 24. 
# Math Fact: Numbers that meet this criteria are also known as highly composite numbers.

# Examples
# p anti_prime?(24)   # true
# p anti_prime?(36)   # true
# p anti_prime?(48)   # true
# p anti_prime?(360)  # true
# p anti_prime?(1260) # true
# p anti_prime?(27)   # false
# p anti_prime?(5)    # false
# p anti_prime?(100)  # false
# p anti_prime?(136)  # false
# p anti_prime?(1024) # false

def divisors(num)
    arr = []
    (1..num).each do |div|
        if num % div == 0
            arr << div
        end
    end
    arr.length
end

def anti_prime?(num)
    anti = divisors(num)
    (1..num).each do |divi|
        if divisors(divi) > anti
            return false
        end
    end
    true
end


# matrix_addition
# Let a 2-dimensional array be known as a "matrix". Write a method matrix_addition that accepts two matrices as arguments. 
# The two matrices are guaranteed to have the same "height" and "width". The method should return a new matrix representing the sum of the two arguments. 
# To add matrices, we simply add the values at the same positions:

# # programmatically
# [[2, 5], [4, 7]] + [[9, 1], [3, 0]] => [[11, 6], [7, 7]]

# # structurally
# 2 5  +  9 1  =>  11 6
# 4 7     3 0      7 7
# Examples
# matrix_a = [[2,5], [4,7]]
# matrix_b = [[9,1], [3,0]]
# matrix_c = [[-1,0], [0,-1]]
# matrix_d = [[2, -5], [7, 10], [0, 1]]
# matrix_e = [[0 , 0], [12, 4], [6,  3]]

# p matrix_addition(matrix_a, matrix_b) # [[11, 6], [7, 7]]
# p matrix_addition(matrix_a, matrix_c) # [[1, 5], [4, 6]]
# p matrix_addition(matrix_b, matrix_c) # [[8, 1], [3, -1]]   
# p matrix_addition(matrix_d, matrix_e) # [[2, -5], [19, 14], [6, 4]]



def matrix_addition(matrix_1, matrix_2)
#debugger
    len = matrix_1.length
    new_arr = Array.new(len) {Array.new(2, 0)}

    new_arr.each_with_index do |array, idx|
        array.each_with_index do |el, index|
            new_arr[idx][index] = matrix_1[idx][index] + matrix_2[idx][index]
        end
    end
    new_arr
end

# mutual_factors
# Write a method mutual_factors that accepts any amount of numbers as arguments. 
# The method should return an array containing all of the common divisors shared among the arguments. 
# For example, the common divisors of 50 and 30 are 1, 2, 5, 10. You can assume that all of the arguments are positive integers.

# Examples
# p mutual_factors(50, 30)            # [1, 2, 5, 10]
# p mutual_factors(50, 30, 45, 105)   # [1, 5]
# p mutual_factors(8, 4)              # [1, 2, 4]
# p mutual_factors(8, 4, 10)          # [1, 2]
# p mutual_factors(12, 24)            # [1, 2, 3, 4, 6, 12]
# p mutual_factors(12, 24, 64)        # [1, 2, 4]
# p mutual_factors(22, 44)            # [1, 2, 11, 22]
# p mutual_factors(22, 44, 11)        # [1, 11]
# p mutual_factors(7)                 # [1, 7]
# p mutual_factors(7, 9)              # [1]

def divisorss(num)
    arr = []
    (1..num).each do |div|
        if num % div == 0
            arr << div
        end
    end
    arr
end

def mutual_factors(*number)

    arr = []
    mutual = divisorss(number[0])
    number.each do |num|
        arr = divisorss(num)
        mutual = mutual & arr
    end
    mutual

end


# tribonacci_number
# The tribonacci sequence is similar to that of Fibonacci. The first three numbers of the tribonacci sequence are 1, 1, and 2. 
# To generate the next number of the sequence, we take the sum of the previous three numbers. The first six numbers of tribonacci sequence are:

# 1, 1, 2, 4, 7, 13, ... and so on
# Write a method tribonacci_number that accepts a number argument, n, and returns the n-th number of the tribonacci sequence.

#Examples
# p tribonacci_number(1)  # 1
# p tribonacci_number(2)  # 1
# p tribonacci_number(3)  # 2
# p tribonacci_number(4)  # 4
# p tribonacci_number(5)  # 7
# p tribonacci_number(6)  # 13
# p tribonacci_number(7)  # 24
# p tribonacci_number(11) # 274

def tribonacci_number(number)
    return 1 if number == 1
    return 1 if number == 2
    return 2 if number == 3

    tribonacci_number(number- 1) + tribonacci_number(number - 2) + tribonacci_number(number - 3)
end




# matrix_addition_reloaded
# Write a method matrix_addition_reloaded that accepts any number of matrices as arguments. 
# The method should return a new matrix representing the sum of the arguments. 
# Matrix addition can only be performed on matrices of similar dimensions, so if all of the given matrices do not have the same "height" and "width", 
# then return nil.

# Examples

# matrix_a = [[2,5], [4,7]]
# matrix_b = [[9,1], [3,0]]
# matrix_c = [[-1,0], [0,-1]]
# matrix_d = [[2, -5], [7, 10], [0, 1]]
# matrix_e = [[0 , 0], [12, 4], [6,  3]]

# p matrix_addition_reloaded(matrix_a, matrix_b)              # [[11, 6], [7, 7]]
# p matrix_addition_reloaded(matrix_a, matrix_b, matrix_c)    # [[10, 6], [7, 6]]
# p matrix_addition_reloaded(matrix_e)                        # [[0, 0], [12, 4], [6, 3]]
# p matrix_addition_reloaded(matrix_d, matrix_e)              # [[2, -5], [19, 14], [6, 4]]
# p matrix_addition_reloaded(matrix_a, matrix_b, matrix_e)    # nil
# p matrix_addition_reloaded(matrix_d, matrix_e, matrix_c)    # nil


def matrix_addition_reloaded(*matrix)

    return matrix[0] if matrix.length == 1 
    len = matrix[0].length
    
    matrix.each do |matr|
        if matr.length != len
            return nil
        end
    end

    if matrix.length == 2
        matrix_addition(matrix[0],matrix[1])
    elsif matrix.length == 3
        matrix_addition(matrix[0], matrix_addition(matrix[1],matrix[2]))
    end


end









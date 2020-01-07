require "byebug"
# strange_sums
# Write a method strange_sums that accepts an array of numbers as an argument. 
# The method should return a count of the number of distinct pairs of elements that have a sum of zero. 
# You may assume that the input array contains unique elements.

# Examples


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



p strange_sums([2, -3, 3, 4, -2])     # 2
p strange_sums([42, 3, -1, -42])      # 1
p strange_sums([-5, 5])               # 1
p strange_sums([19, 6, -3, -20])      # 0
p strange_sums([9])                   # 0
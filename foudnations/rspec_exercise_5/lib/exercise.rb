def zip(*arrays)

    new_array = Array.new(3){Array.new}

    arrays.each_with_index do |array,array_inde|
        array.each_with_index do |ele,index|
            new_array[index][array_inde] = ele
        end
    end

    new_array

end



array_1 = ['a', 'b', 'c']
array_2 = [1, 2, 3] 
array_3 = ['w', 'x', 'y']

p zip(array_1, array_2)
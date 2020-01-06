def zip(*arrays)

    new_array = Array.new(3){Array.new}

    arrays.each_with_index do |array,array_inde|
        array.each_with_index do |ele,index|
            new_array[index][array_inde] = ele
        end
    end

    new_array

end

def prizz_proc(array,prc1,prc2)

    new_array = []

        array.each do |ele|
            if prc1.call(ele) && !prc2.call(ele) || prc2.call(ele) && !prc1.call(ele)
              new_array << ele
            end  
        end
    new_array
end



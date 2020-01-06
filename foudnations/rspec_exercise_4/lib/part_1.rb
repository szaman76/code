def my_reject(array, &prc)
    result = []
    
    array.each do |ele|
        if !prc.call(ele)
            result << ele
        end
    end
    result
end

def my_one?(array, &prc)
    count = 0
    array.each do |ele|
        count += 1 if prc.call(ele)
    end
    count == 1
end

def hash_select(hash, &prc)

    new_hash = Hash.new()

    hash.each do |key,value|
        if prc.call(key,value)
            new_hash[key] = hash[key]
        end
    end
    new_hash
end


def xor_select(array, prc1, prc2)

    new_array = []
    array.each do |ele|
        if prc1.call(ele) && !prc2.call(ele) || !prc1.call(ele) && prc2.call(ele) 
            new_array << ele
        end
    end
    new_array
end

def proc_count(value,array)
    count = 0
    array.each do |prc|

        if prc.call(value)
            count += 1
        end
    end
    count

end
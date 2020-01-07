def zip(*arrays)
    length = arrays.first.length

    (0...length).map do |i|
        arrays.map { |array| array[i] }
    end
end

def prizz_proc(array, prc_1, prc_2)
    array.select do |el|
        (prc_1.call(el) && !prc_2.call(el)) || (!prc_1.call(el) && prc_2.call(el))
    end
end

def zany_zip(*arrays)
    length = arrays.map(&:length).max

    (0...length).map do |i|
        arrays.map { |array| array[i] }
    end
end


def maximum(array, &block)

    return nil if array.empty?
    max = array.first
    array.each do |el|
        max = el if block.call(el) >= block.call(max)        
    end
    max
end

def my_group_by(array, &block)

    new_hash = Hash.new {|h,k| h[k] = []}
    array.each do |el|
        new_hash[block.call(el)] << el
    end
    new_hash
end

def max_tie_breaker(array, prc, &block)

    return nil if array.empty?
    max = array.first
    array.each do |el|
        chech_el = block.call(el)
        max_el = block.call(max) 
        if chech_el > max_el 
            max = el
        elsif chech_el == max_el && prc.call(el) > prc.call(max)
            max = el      
        end
    end
    max
end

def change_word(word)
    index = vowels_index(word)
    word[index[0]..index[-1]]
end

def vowels_index(word)
    vowels = "aeiou"
    vowels_index = []

    word.each_char.with_index do |char, i|
        if vowels.include?(char)
            vowels_index << i
        end
    end
    vowels_index    

end

def silly_syllables(string)
    words = string.split(' ')

    new_words = words.map do |word|
        vowels_number = vowels_index(word).length
        if vowels_number < 2
            word
        else
            change_word(word)
        end
    end

    new_words.join(" ")
    
end



p silly_syllables('properly and precisely written code')
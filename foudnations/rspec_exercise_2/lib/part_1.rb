def partition(arr, num)

    less = []
    more = []

    arr.each do |ele|
        if ele >= num
            more << ele
        else
            less << ele
        end
    end
    [less,more]
end

def merge(hash_1,hash_2)

    nowy = Hash.new(0)
    hash_1.each do |key,value|
        nowy[key] = hash_1[key]
    end
    hash_2.each do |key,value|
        nowy[key] = hash_2[key]
    end
    nowy
end

def censor(str,array)

    vowels = "aeiou"
    arr = str.split(" ")
    arr.each do |word|
        if array.include?(word.downcase)
            word.each_char do |char|
                if vowels.include?(char.downcase)
                    word[char] = "*"
                end
            end
        end
    end
arr.join(" ")
end

def power_of_two?(num)

    i = 1
    while i <= num
        if num == i
            return true
        end
        i *= 2
    end
    return false


end


p power_of_two?(22)
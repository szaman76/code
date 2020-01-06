require "byebug"

def element_count(array)

    count = Hash.new(0)

    array.each do |ele|
        count[ele] += 1
    end
    count

end


def char_replace!(string, hash)
#debugger

    string.each_char.with_index do |char,idx|

        if hash.has_key?(char)
            string[idx] = hash[char]
        else
            char
        end
    end
    string
end


def product_inject(array)
    array.inject {|sum,n| sum * n}
end
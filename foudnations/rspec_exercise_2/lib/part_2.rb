def palindrome?(str)

    i = 0
    while i < str.length

        if str[i] != str[-1-i]
            return false
        end
        i += 1
    end
    return true
end

def substrings(string)

    arr = []
    i = 0

    while i < string.length
        j = i + 1
            while j <= string.length
                arr << string[i...j]
                j += 1
            end
        i += 1
    end
    arr

end

def palindrome_substrings(string)

    result = []

    substr = substrings(string)

    substr.each do |word|
        if palindrome?(word) && word.length > 1
            result << word
        end
    end
    result
end


p palindrome_substrings("madam")
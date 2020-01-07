# duos
# Write a method duos that accepts a string as an argument and returns the count of the 
# number of times the same character appears consecutively in the given string.

# Examples

def duos(str)
    count = 0
    str.each_char.with_index do |ch,idx|
        if str[idx] == str[idx +1]
            count += 1
        end
    end
    count
end


# p duos('bootcamp')      # 1
# p duos('wxxyzz')        # 2
# p duos('hoooraay')      # 3
# p duos('dinosaurs')     # 0
# p duos('e')             # 0


# sentence_swap
# Write a method sentence_swap that accepts a sentence and a hash as arguments. 
# The method should return a new sentence where every word is replaced with it's 
# corresponding value in the hash. If a word does not exist as a key of the hash, then it should remain unchanged.

# Examples

def sentence_swap(sent,hash)

    words = sent.split(" ")

    words.each_with_index do |word,idx|
        hash.each do |key,value|
            if word == key 
                words[idx] = value
            end
        end
    end
    words.join(" ")
end



# p sentence_swap('anything you can do I can do',
#     'anything'=>'nothing', 'do'=>'drink', 'can'=>'shall'
# ) # 'nothing you shall drink I shall drink'

# p sentence_swap('what a sad ad',
#     'cat'=>'dog', 'sad'=>'happy', 'what'=>'make'
# ) # 'make a happy ad'

# p sentence_swap('keep coding okay',
#     'coding'=>'running', 'kay'=>'pen'
# ) # 'keep running okay'

# hash_mapped
# Write a method hash_mapped that accepts a hash, a proc, and a block. 
# The method should return a new hash where each key is the result of the original key when given to the block. 
# Each value of the new hash should be the result of the original values when passed into the proc.

# Examples


def hash_mapped(hash,prc,&block)

    result = Hash.new()

    hash.each do |key,value|
        result.store(block.call(key),prc.call(value))
    end
    result
end

# double = Proc.new { |n| n * 2 }
# p hash_mapped({'a'=>4, 'x'=>7, 'c'=>-3}, double) { |k| k.upcase + '!!' }
# # {"A!!"=>8, "X!!"=>14, "C!!"=>-6}

# first = Proc.new { |a| a[0] }
# p hash_mapped({-5=>['q', 'r', 's'], 6=>['w', 'x']}, first) { |n| n * n }
# # {25=>"q", 36=>"w"}

# counted_characters
# Write a method counted_characters that accepts a string as an argument. 
# The method should return an array containing the characters of the string that appeared more than twice. 
# The characters in the output array should appear in the same order they occur in the input string.

# Examples

def counted_characters(str)

    arr = []
    str.each_char do |ch|
        arr << ch if str.count(ch) > 2
    end
    arr.uniq
end

# p counted_characters("that's alright folks") # ["t"]
# p counted_characters("mississippi") # ["i", "s"]
# p counted_characters("hot potato soup please") # ["o", "t", " ", "p"]
# p counted_characters("runtime") # []


# triplet_true?
# Write a method triplet_true? that accepts a string as an argument and returns a boolean indicating whether or not the string contains 
# three of the same character consecutively.

# Examples

def triplet_true?(str)
    return false if str.length < 3
    arr = str.split("")
    (0...arr.length - 2).each do |i|
        if arr[i] == arr[i+1] && arr[i] == arr[i+2]
            return true
        end
    end
    false
end

# p triplet_true?('caaabb')        # true
# p triplet_true?('terrrrrible')   # true
# p triplet_true?('runninggg')     # true
# p triplet_true?('bootcamp')      # false
# p triplet_true?('e')             # false

# energetic_encoding
# Write a method energetic_encoding that accepts a string and a hash as arguments. 
# The method should return a new string where characters of the original string are replaced with the corresponding values in the hash. 
# If a character is not a key of the hash, then it should be replaced with a question mark ('?'). Space characters (' ') should remain unchanged.

# Examples

def energetic_encoding(string,hash)
    arr = string.split("")

    arr.each_with_index do |ch,idx|
        if hash.has_key?(ch)
            arr[idx] = hash[ch]
        elsif ch == " "
            " "
        else
            arr[idx] = "?"
        end
    end
    arr.join("")
end



# p energetic_encoding('sent sea',
#     'e'=>'i', 's'=>'z', 'n'=>'m', 't'=>'p', 'a'=>'u'
# ) # 'zimp ziu'

# p energetic_encoding('cat',
#     'a'=>'o', 'c'=>'k'
# ) # 'ko?'

# p energetic_encoding('hello world',
#     'o'=>'i', 'l'=>'r', 'e'=>'a'
# ) # '?arri ?i?r?'

# p energetic_encoding('bike', {}) # '????'


# uncompress
# Write a method uncompress that accepts a string as an argument. 
# The string will be formatted so every letter is followed by a number. 
# The method should return an "uncompressed" version of the string where every letter is repeated multiple 
# times given based on the number that appears directly after the letter.

# Examples

def uncompress(str)

    new_str = ""
    i = 0
    while i < str.length - 1
        what = str[i] * str[i+1].to_i
        new_str += what
        i += 2
    end
    new_str

end

# p uncompress('a2b4c1') # 'aabbbbc'
# p uncompress('b1o2t1') # 'boot'
# p uncompress('x3y1x2z4') # 'xxxyxxzzzz'








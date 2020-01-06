require "byebug"
# Write a method, all_vowel_pairs, that takes in an array of words and returns all pairs of words
# that contain every vowel. Vowels are the letters a, e, i, o, u. A pair should have its two words
# in the same order as the original array. 
#
# Example:
#
# all_vowel_pairs(["goat", "action", "tear", "impromptu", "tired", "europe"])   # => ["action europe", "tear impromptu"]
def all_vowel_pairs(words)

    #vowel array
    vowels = ["a","e","i","o","u"]
    #all vowels pairs/ the result
    pairs = []
    # hasz with 0 as default value
    hasz = Hash.new(0)
    #each word do
    (0...words.length-1).each do |idx|
        #each next word do
        (idx+1..words.length-1).each do |index|
            # pairs = word + next words
            checking_pairs = words[idx] +" "+ words[index]

            vowels.each do |vowel|
                # if pairs does not include vowel
                if !checking_pairs.include?(vowel)
                    break
                else
                    # add pair to hasz 
                    hasz[checking_pairs] += 1
                end
            end
        end
    end 
    #search hasz for keys that value == vowels.length that mean 
    #it contains all vowels
    hasz.each do |key,value|
        if value ==vowels.length
            #add all vowels pair to pairs array
            pairs << key
        end
    end
    #return pairs array
    pairs
end


# Write a method, composite?, that takes in a number and returns a boolean indicating if the number
# has factors besides 1 and itself
#
# Example:
#
# composite?(9)     # => true
# composite?(13)    # => false
def composite?(num)

    (2...num).each do |factor|
        if num % factor == 0
            return true
        end
    end
    return false
end


# A bigram is a string containing two letters.
# Write a method, find_bigrams, that takes in a string and an array of bigrams.
# The method should return an array containing all bigrams found in the string.
# The found bigrams should be returned in the the order they appear in the original array.
#
# Examples:
#
# find_bigrams("the theater is empty", ["cy", "em", "ty", "ea", "oo"])  # => ["em", "ty", "ea"]
# find_bigrams("to the moon and back", ["ck", "oo", "ha", "at"])        # => ["ck", "oo"]
def find_bigrams(str, bigrams)
    result = []

    bigrams.each do |ele|

        if str.include?(ele)
            result << ele
        end
    end
    result
end

class Hash
    # Write a method, Hash#my_select, that takes in an optional proc argument
    # The method should return a new hash containing the key-value pairs that return
    # true when passed into the proc.
    # If no proc is given, then return a new hash containing the pairs where the key is equal to the value.
    #
    # Examples:
    #
    # hash_1 = {x: 7, y: 1, z: 8}
    # hash_1.my_select { |k, v| v.odd? }          # => {x: 7, y: 1}
    #
    # hash_2 = {4=>4, 10=>11, 12=>3, 5=>6, 7=>8}
    # hash_2.my_select { |k, v| k + 1 == v }      # => {10=>11, 5=>6, 7=>8})
    # hash_2.my_select                            # => {4=>4}
    def my_select(&prc)
 
        prc ||= Proc.new {|k,v| k == v}
        hasz = {}

        self.each do |key,value|
            hasz[key] = value if prc.call(key,value)
        end
        hasz
    
    end
end

class String
    # Write a method, String#substrings, that takes in a optional length argument
    # The method should return an array of the substrings that have the given length.
    # If no length is given, return all substrings.
    #
    # Examples:
    #
    # "cats".substrings     # => ["c", "ca", "cat", "cats", "a", "at", "ats", "t", "ts", "s"]
    # "cats".substrings(2)  # => ["ca", "at", "ts"]
    def substrings(length = nil)
        result = []
        # array of substrings
            (0...self.length).each do |idx|
                (idx+1..self.length).each do |index|
                    result << self[idx...index]
                end
            end  
            #if there is a length in arguments
        if length
            result.select {|ele| ele.length == length}
        else
            result
        end
    end


    # Write a method, String#caesar_cipher, that takes in an a number.
    # The method should return a new string where each char of the original string is shifted
    # the given number of times in the alphabet.
    #
    # Examples:
    #
    # "apple".caesar_cipher(1)    #=> "bqqmf"
    # "bootcamp".caesar_cipher(2) #=> "dqqvecor"
    # "zebra".caesar_cipher(4)    #=> "difve"


    # 26
    def caesar_cipher(num)
        alphabet = []
        result = ""
        # alphabet is array of letters
        ("a".."z").each do |letter|
            alphabet << letter
        end
            #self string.split and then every letter
        self.split("").each do |word_letter|
                #new letter is index of word letter in alphabet
            new_letter = alphabet.index(word_letter)  # 1
                #add new letter to result 26 is number of letters in alphabet 
            result += alphabet[(new_letter+num)%26]
        end
        result
    end
end

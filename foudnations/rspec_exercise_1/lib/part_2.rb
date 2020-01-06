def hipsterfy(word)
    vowel = "aeiou"

    arr = word.reverse.split("")

        arr.each_with_index do |char,i|
            if vowel.include?(char)
                arr[i] = ""
                break
            end
        end
    arr.reverse.join("")
end

def vowel_counts(string)

    vowel = "aeiou"
    has = Hash.new(0)

    string.downcase.each_char do |char|
        if vowel.include?(char)
            has[char] += 1
        end
    end
    has
end

def caesar_cipher(msg,num)

    abet = "abcdefghijklmnopqrstuvwxyz"
    omg = []
    arr = msg.split("")

        arr.each_with_index do |char,i|
            if abet.include?(char)
                omg << abet[(abet.index(char) + num) % 26]
            else
                omg << char
            end
        end
        omg.join("")
end


p caesar_cipher("123 _-!?@%",3)
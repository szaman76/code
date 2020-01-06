require "byebug"

def select_even_nums(array)
    array.select(&:even?)
end

def reject_puppies(array)
    array.reject{ |dog| dog["age"] <= 2 }
end

def count_positive_subarrays(array)
    array.count{|sub| sub.sum > 0}
end

def aba_translate(string)
    vowels = "aeiou"
    chars = string.split("")
    array = []
    chars.each do |ele|
        if vowels.include?(ele)
            array << ele + "b" + ele
        else
            array << ele
        end
    end
    array.join("")
end

def aba_array(arr)
    arr.map{|ele| aba_translate(ele)}
end


p reject_puppies([
    {"name"=>"Fido", "age"=>3},
    {"name"=>"Spot", "age"=>2},
    {"name"=>"Rex", "age"=>5},
    {"name"=>"Gizmo", "age"=>1}
  ])
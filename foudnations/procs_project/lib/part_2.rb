require "byebug"

def reverser(string, &prc)
    prc.call(string.reverse)
end

def word_changer(string, &prc)
    array = string.split(" ")
    new_array = []
    array.each {|ele| new_array << prc.call(ele)}
    new_array.join(" ")
end

def greater_proc_value(number, proc_1, proc_2)
    return proc_1.call(number) if proc_1.call(number) > proc_2.call(number)
    proc_2.call(number)
end

def and_selector(array, proc_1, proc_2)
    new_array  = []
    array.each {|ele| new_array << ele if (proc_1.call(ele) && proc_2.call(ele)) }
    new_array
end

def alternating_mapper(array,proc_1,proc_2)
    new_array = []
    array.each_with_index do |ele, idx|
         if idx.even?
            new_array << proc_1.call(ele)
         else
            new_array << proc_2.call(ele)
         end
    end
    new_array
end

p alternating_mapper([1,2,3,4,5], half, times_thousand)
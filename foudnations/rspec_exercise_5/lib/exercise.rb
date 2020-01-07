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

def is_prime?(num)
    return false if num < 2

    (2...num).each do |factor|
        if num % factor == 0
            return false
        end

    end
    return true
end


def nth_prime(number)

    primes = []
    i = 2
    while primes.length < number
        if is_prime?(i)
            primes << i 
        end
        i += 1
    end

    return primes[number-1]
end

def prime_range(min, max)
    result = []

    (min..max).each do |num|
        if is_prime?(num)
            result << num
        end
    end
    result
end
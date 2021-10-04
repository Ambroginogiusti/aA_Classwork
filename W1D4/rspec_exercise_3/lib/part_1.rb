def is_prime?(n)
    return false if n < 2
    (2...n).any? { |i| return false if n % i == 0 }
    return true
end

def nth_prime(n)
    count = 0
    i = 2
    while true
        count += 1 if is_prime?(i)
        return i if count == n
        i += 1
    end
end

def prime_range(min, max)
    a = []
    (min..max).each { |i| a << i if is_prime?(i)}
    return a
end
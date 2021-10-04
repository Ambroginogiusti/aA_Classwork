def proper_factors(n)
    a = []
    (1...n).each { |i| a << i if n % i == 0 }
    return a
end

def aliquot_sum(n)
    proper_factors(n).sum
end

def perfect_number?(n)
    n == aliquot_sum(n)
end

def ideal_numbers(n)
    a = []
    c = 0
    i = 1
    while true
        a << i if perfect_number?(i)
        c += 1 if perfect_number?(i)
        return a if c == n
        i += 1
    end
end
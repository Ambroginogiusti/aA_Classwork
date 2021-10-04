# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

def largest_prime_factor(number)
    i = number
    while i > 1
        if number % i == 0 && prime?(i)
            return i
        end
        i -= 1
    end
end

def prime?(num)
     return false if num < 2
     (2...num).each do |i|
        return false if num % i ==0
     end
     true
end

def unique_chars?(string)
    array = []
    string.each_char do |char|
        if array.include?(char)
            return false
        else
            array << char
        end
    end
    true
end

def dupe_indices(array)
    hash = Hash.new { |h, k| h[k] = []}
    array.each.with_index do |el, idx|
        hash[el] << idx
    end
    hash.select! do |el, idx|
        idx.length > 1
    end
    hash
end

def ana_array(arr1, arr2)
    return false if arr1.length != arr2.length
    arr1.each do |el|
        return false if !arr2.include?(el)
    end
    arr2.each do |el|
        return false if !arr1.include?(el)
    end
    true
end
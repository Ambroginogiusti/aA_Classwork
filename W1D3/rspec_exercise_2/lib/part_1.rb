def partition(array, number)
    results = Array.new(2) { Array.new(1) }
    array.each do |el|
        if el < number
            results[0] << el
        else
            results[1] << el
        end
    end
    results[0].shift
    results[1].shift
    results
end

def merge(hash1, hash2)
    hash3 = {}
    hash1.each do |k, v|
        hash3[k] = v
    end
    hash2.each do |k, v|
        hash3[k] = v
    end
    hash3
end

def censor(sentence, curses)
    vowels = 'AEIOUaeiou'
    words = sentence.split
    words.map do |word|
        if curses.include?(word.downcase)
            word.each_char.with_index do |char, idx|
                if vowels.include?(char)
                    word[idx] = '*'
                end
            end
            word
        else
            word
        end
    end
    words.join(' ')
end

def power_of_two?(number)
    product = 1
    while product < number
        product *= 2
    end
    product == number
end

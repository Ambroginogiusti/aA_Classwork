def select_even_nums(numbers)
    numbers.select(&:even?)
end

def reject_puppies(dogs)
    dogs.reject { |dog| dog['age'] <= 2 }
end

def count_positive_subarrays(arrays)
    arrays.count { |array| array.sum.positive? }
end

def aba_translate(word)
    vowels = 'aeiou'
    chars = word.split('')
    chars.map! do |char|
        if vowels.include?(char)
            char + 'b' + char
        else
            char
        end
    end
    chars.join
end

def aba_array(words)
    words.map { |word| aba_translate(word) }
end
def hipsterfy(word)
    vowels = 'aeiou'
    word.reverse!
    word.each_char.with_index do |char, idx|
        if vowels.include?(char)
            word.slice!(idx)
            return word.reverse!
        end
    end
    word.reverse!
end

def vowel_counts(string)
    hash = {}
    string.downcase!
    vowels = 'aeiou'
    string.each_char do |char|
        if vowels.include?(char) && !hash.has_key?(char)
            hash[char] = 1
        elsif vowels.include?(char) && hash.has_key?(char)
            hash[char] += 1
        end
    end
    hash
end

def caesar_cipher(message, n)
    new_string = ''
    alphabet = ('a'..'z').to_a
    message.each_char.with_index do |char, idx|
        if alphabet.include?(char)
            old_idx = alphabet.index(char)
            new_idx = (old_idx + n) % alphabet.length
            new_string += alphabet[new_idx]
        else
            new_string += char
        end
    end
    new_string
end
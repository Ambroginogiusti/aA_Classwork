def all_words_capitalized?(words)
    words.all? do |word|
        word[0] == word[0].upcase && word[1..-1] == word[1..-1].downcase
    end
end

def  no_valid_url?(urls)
    valid = ['com', 'net', 'io', 'org']
    urls.none? do |url|
        check = url.split('.')
        valid.include?(check[1])
    end
end

def any_passing_students?(students)
    students.any? do |student|
        pass = 75
        sum = student[:grades].sum
        count = student[:grades].count
        sum / (count * 1.0) >= 75
    end
end

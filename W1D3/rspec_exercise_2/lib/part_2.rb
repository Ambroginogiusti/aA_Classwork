def palindrome?(string)
    string_reversed = ''
    i = string.length - 1
    while i >= 0
        string_reversed += string[i]
        i -= 1
    end
    string == string_reversed
end

def substrings(string)
    array = []
    i = 0
    while i < string.length
        j = string.length - 1
        while j >= i
            array << string.slice(i..j)
            j -= 1
        end
        i += 1
    end
    array
end

def palindrome_substrings(string)
    array = []
    subs = substrings(string)
    subs.each do |sub|
        array << sub if sub.length > 1 && palindrome?(sub)
    end
    array
end
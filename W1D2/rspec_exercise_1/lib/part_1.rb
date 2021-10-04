def average(num1, num2)
    (num1 + num2) / 2.0
end

def average_array(array)
    sum = 0
    array.each do |num|
        sum += num
    end
    avg = sum / (array.length * 1.0)
    avg
end

def repeat(str, num)
    str * num
end

def yell(str)
    str.upcase! + '!'
end

def alternating_case(sent)
    words = sent.split(' ')
    words.each.with_index do |word, idx|
        if idx % 2 == 0
            word.upcase!
        else
            word.downcase!
        end
    end
    words.join(' ')
end
def reverser(string, &prc)
    prc.call(string.reverse)
end

def word_changer(sentence, &prc)
    new_sentence = sentence.split
    new_sentence.map! { |el| prc.call(el) }
    new_sentence.join(' ')
end

def greater_proc_value(number, prc1, prc2)
    if prc1.call(number) > prc2.call(number)
        return prc1.call(number)
    else
        return prc2.call(number)
    end
end

def and_selector(array, prc1, prc2)
    new_array = []
    array.each do |el|
        if prc1.call(el) && prc2.call(el)
            new_array << el
        end
    end
    new_array
end

def alternating_mapper(array, prc1, prc2)
    new_array = []
    array.each.with_index do |el, idx|
        new_array << prc1.call(el) if idx.even?
        new_array << prc2.call(el) if idx.odd?
    end
    new_array
end
def my_map(array, &prc)
    new_array = []
    array.each do |el|
        new_array << prc.call(el)
    end
    new_array
end

def my_select(array, &prc)
    new_array = []
    array.each do |el|
        new_array << el if prc.call(el)
    end
    new_array
end

def my_count(array, &prc)
    count = 0
    array.each { |el| count += 1 if prc.call(el) }
    count
end

def my_any?(array, &prc)
    array.each do |el|
        return true if prc.call(el)
    end
    false
end

def my_all?(array, &prc)
    array.each do |el|
        return false if !prc.call(el)
    end
    true
end

def my_none?(array, &prc)
    array.each do |el|
        return false if prc.call(el)
    end
    true
end
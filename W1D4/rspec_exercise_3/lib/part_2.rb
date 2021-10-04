def element_count(a)
    h = {}
    a.each do |e|
        if h.key?(e)
            h[e] += 1
        else
            h[e] = 1
        end
    end
    return h
end

def char_replace!(s, h)
    s.each_char.with_index do |c, i|
        s[i] = h[c] if h.key?(c)
    end
    return s
end

def product_inject(a)
    return a.inject do |acc, e|
        acc *= e
    end
end
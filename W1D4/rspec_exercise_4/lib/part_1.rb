def my_reject(a, &b)
    a2 = []
    a.each { |e| a2 << e if !b.call(e)}
    return a2
end

def my_one?(a, &b)
    c = 0
    a.each { |e| c += 1 if b.call(e)}
    return c == 1
end

def hash_select(h, &b)
    h2 = {}
    h.each { |k, v| h2[k] = v if b.call(k, v)}
    return h2
end

def xor_select(a, p1, p2)
    a2 = []
    a.each do |e|
        a2 << e if !(p1.call(e) && p2.call(e)) && (p1.call(e) || p2.call(e))
    end
    return a2
end

def proc_count(v, a)
    c = 0
    a.each { |e| c += 1 if e.call(v)}
    return c
end
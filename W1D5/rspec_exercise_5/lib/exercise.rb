def zip(*a)
  l = a.first.length
  (0...l).map do |i|
      a.map { |e| e[i] }
  end
end

def prizz_proc(a, p1, p2)
  a2 = []
  a.each do |e|
    if (p1.call(e) || p2.call(e)) && !(p1.call(e) && p2.call(e))
      a2.push(e)
    end
  end
  a2
end

def zany_zip(*a)
  a2 = a.sort_by { |e| e.length}
  l = a2.last.length
  (0...l).map do |i|
    a.map { |e| e[i]}
  end
end

def maximum(a, &b)
  a.reduce do |m, e|
    if b.call(e) >= b.call(m)
      m = e
    end
    m
  end
end

def my_group_by(a, &b)
  h = {}
  a.each do |e|
    if !h.key?(b.call(e))
      h[b.call(e)] = [e]
    else
      h[b.call(e)].push(e)
    end
  end
  h
end

def max_tie_breaker(a, p, &b)
  a.reduce do |l, e|
    if b.call(l) < b.call(e)
      l = e
    elsif (b.call(l) == b.call(e)) && (p.call(l) < p.call(e))
      l = e
    end
    l
  end
end

def silly_syllables(s)
  s2 = []
  a = s.split
  a.each.with_index do |w, i|
    if two_v(w)
      s2.push(remover(w))
    else
      s2.push(w)
    end
  end
  s2.join(' ')
end

def two_v(w)
  n = 0
  v = 'AEIOUaeiou'
  w.each_char do |c|
    n += 1 if v.include?(c)
  end
  n >= 2
end

def remover(w)
  v = 'AEIOUaeiou'
  i1 = nil
  i2 = nil
  n = 0
  until n == w.length - 1
    if v.include?(w[n])
      i1 = n
      break
    end
    n += 1
  end
  m = w.length - 1
  until m == 0
    if v.include?(w[m])
      i2 = m
      break
    end
    n -= 1
  end
  w.slice(i1..i2)
end
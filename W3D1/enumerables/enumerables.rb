require 'byebug'

class Array

  def my_each(&prc)
    i = 0
    while i < self.length
      prc.call(self[i])
      i += 1
    end
    self
  end

  def my_select(&prc)
    new_arr = []
    self.my_each { |el| new_arr << el if prc.call(el) }
    new_arr
  end

  def my_reject(&prc)
    new_arr = []
    self.my_each { |el| new_arr << el if !prc.call(el) }
    new_arr
  end

  def my_any?(&prc)
    self.my_each do |el|
        if prc.call(el)
            return true
        end
    end
    false
  end

  def my_all?(&prc)
    self.my_each do |el|
        if !prc.call(el)
            return false
        end
    end
    true
  end

  def my_flatten
    new_arr = []
    return [self] if !self.is_a?(Array)
    self.each do |el|
      if el.is_a?(Array)
        new_arr.concat(el.my_flatten)
      else
        new_arr << el 
      end
    end
    new_arr
  end

  def my_zip(*arrs)
    new_arr = []
    self.length.times do |idx|
        sub_arr = [self[idx]]
        arrs.each_with_index do |sub, i|
            sub_arr << sub[idx]
        end
        new_arr << sub_arr
    end
    new_arr
  end

  def my_rotate(rotates=1)
    new_arr = self.dup
    if rotates > 0
      rotates.times do
        x = new_arr.shift
        new_arr.push(x)
      end
    else
      (rotates * -1).times do
        x = new_arr.pop
        new_arr.unshift(x)
      end
    end
    new_arr
  end

  def my_join(sep="")
    str = ""
    self.each.with_index do |el, i|
      if i == self.length - 1
        str += (el.to_s)
      else
        str += (el.to_s + sep)
      end
    end
    str
  end

  def my_reverse
    new_arr = []
    i = -1
    until i < -(self.length)
      new_arr << self[i]
      i -= 1
    end
    new_arr
  end

end

def sum_to(n)
  return nil if n < 1
  return n if n == 1
  n + sum_to(n-1)
end

def add_numbers(arr)
  return arr.first if arr.length <= 1
  arr.pop + add_numbers(arr)
end

def gamma_fnc(num)
  return nil if num < 1
  return 1 if num == 1
  (num - 1) * gamma_fnc(num - 1)
end

def ice_cream_shop(flavors, favorite)
  return false if flavors.empty?
  return true if flavors.last == favorite
  ice_cream_shop(flavors[0...-1], favorite)
end

def reverse(string)
  return "" if string.empty?
  reverse(string[1..-1]) + string[0]
end
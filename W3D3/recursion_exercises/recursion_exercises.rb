def range(start, endpoint)
  if start == endpoint - 1
    return [start]
  end
  [start] + range(start + 1, endpoint)
end

# p range(1, 5)

def exp(base, ex)
  return 1 if ex == 0
  # return base if ex == 1
  base * exp(base, ex - 1)
end

# p exp(5, 2)
# p exp(3, 3)

class Array

  def dup
    new_arr = []
    self.each do |el|
      if !(el.is_a?(Array))
        new_arr << el
      else
        new_arr << el.dup
      end
    end
    return new_arr
  end

end

# arr = [1, 2, 3, [4, 5], [[6]]]

# b = arr.dup
# b[3] << [1]
# p b
# p arr

def fib_rec(n)
  return [0] if n == 1
  return [0, 1] if n == 2
  prev = fib_rec(n - 1)
  next_fib = prev[-1] + prev[-2]
  prev << next_fib
end

# p fib_rec(8)

def fib_itr(n)
  return [0] if n == 1
  fib_arr = [0, 1]
  (n - 2).times do
    fib_arr << fib_arr[-1] + fib_arr[-2]
  end
  fib_arr
end

# p fib_itr(8)

def bsearch(arr, target)
  # return nil if arr == []
  middle_idx = arr.length / 2
  compare = target <=> arr[middle_idx]
  if  compare == -1
    bsearch(arr[0...middle_idx], target)
  elsif compare == 1
    after = bsearch(arr[middle_idx + 1..-1], target)
    if after != nil
      return after + middle_idx + 1
    else
      return after
    end
    # bsearch(arr[middle_idx + 1..-1], target) + middle_idx + 1
  elsif compare == 0
    return middle_idx
  end
end

# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

def merge(arr1, arr2)
  new_arr = []
  while arr1.size > 0 && arr2.size > 0
    compare = arr1[0] <= arr2[0]
    if compare
      new_arr << arr1.shift
    else
      new_arr << arr2.shift
    end
  end
  new_arr + arr1 + arr2
end

# p merge([1, 3, 5, 8, 7], [2, 4, 6])

def merge_sort(arr)
  return arr if arr.length <= 1

  middle_idx = arr.length / 2

  left = arr[0...middle_idx]
  right = arr[middle_idx..-1]

  merge(merge_sort(left), merge_sort(right))

end

# p merge_sort([1,4,3,6,1,8,6,99,2,4,65])


def subsets(arr)
  return [arr] if arr == []
  prev = subsets(arr[0...-1])
  after = prev.dup.map { |sub_arr| sub_arr << arr[-1]}
  prev + after
end

# def subsets(array)
#   return [array] if array.empty? 
#   subs = []
#   last = array.pop
#   sub = subsets(array)
#   sub_nxt = sub.map { |arr| arr + [last] }
#   subs += sub + sub_nxt
#   subs
# end

# p subsets([]) # => [[]]
# p subsets([1]) # => [[], [1]]
# p subsets([1, 2]) # => [[], [1], [2], [1, 2]]
# p subsets([1, 2, 3]) # => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]

# def permutations(array)
#   return array if array.length <= 1
#   new_arr = []
#   first_el = array.shift
#   all_but_first = permutations(array)
#   (0..array.length).each do |i|
#     new_arr << [first_el] + [all_but_first]
#   end
#   new_arr
# end

def permutations(array)
  return [array] if array.length <= 1
  new_arr = []
  (0...array.length).each do |i|
    rest = array[0...i] + array[i+1..-1]
    part_arr = (permutations(rest)).map do |sub_arr|
      sub_arr.unshift(array[i])
    end
    new_arr += part_arr
  end
  new_arr
end

#per([1]) # => [[1]]
#per([2]) # => [[2]]
#per([1,2]) # => [[1,2], [2,1]]
#per([1,2]) # => [1,2] + per([2])[0] << 1

#permutations([1, 2, 3, 4]) # => [[1, 2, 3], [1, 3, 2],
                         #     [2, 1, 3], [2, 3, 1],
                         #     [3, 1, 2], [3, 2, 1]]

#permutations([1, 2, 3]) # => [[1, 2, 3], [1, 3, 2],
                         #     [2, 1, 3], [2, 3, 1],
                         #     [3, 1, 2], [3, 2, 1]]

p permutations([1, 2, 3, 4]) == [1, 2, 3, 4].permutation.to_a # => true
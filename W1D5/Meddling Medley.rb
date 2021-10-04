# Meddling Medley
# This problem set will test your knowledge about the last few topics you explored. Like usual, the difficulty will ramp up as work through the set. Ready? Let's do it.

# The solution is available here, but please do not look at it until you have attempted all of the problems!

# Phase 1: Modest problems.
def duos(s)
  c = 0
  i = 0
  while i < s.length
    if s[i] == s[i + 1]
      c += 1
    end
    i += 1
  end
  c
end
# Write a method duos that accepts a string as an argument and returns the count of the number of times the same character appears consecutively in the given string.

# Examples

# p duos('bootcamp')      # 1
# p duos('wxxyzz')        # 2
# p duos('hoooraay')      # 3
# p duos('dinosaurs')     # 0
# p duos('e')             # 0

def sentence_swap(s, h)
  a = s.split
  a.map! do |e|
    e = h[e] if h[e]
    e if !h[e]
  end
  a.join(' ')
end
# Write a method sentence_swap that accepts a sentence and a hash as arguments. The method should return a new sentence where every word is replaced with it's corresponding value in the hash. If a word does not exist as a key of the hash, then it should remain unchanged.

# Examples

# p sentence_swap('anything you can do I can do',
#     'anything'=>'nothing', 'do'=>'drink', 'can'=>'shall'
# ) # 'nothing you shall drink I shall drink'

# p sentence_swap('what a sad ad',
#     'cat'=>'dog', 'sad'=>'happy', 'what'=>'make'
# ) # 'make a happy ad'

# p sentence_swap('keep coding okay',
#     'coding'=>'running', 'kay'=>'pen'
# ) # 'keep running okay'

def hash_mapped(h, p, &b)
  h1 = {}
  h.each {|k, v| h1[b.call(k)] = p.call(v)}
  h1
end
# Write a method hash_mapped that accepts a hash, a proc, and a block. The method should return a new hash where each key is the result of the original key when given to the block. Each value of the new hash should be the result of the original values when passed into the proc.

# Examples

# double = Proc.new { |n| n * 2 }
# p hash_mapped({'a'=>4, 'x'=>7, 'c'=>-3}, double) { |k| k.upcase + '!!' }
# # {"A!!"=>8, "X!!"=>14, "C!!"=>-6}

# first = Proc.new { |a| a[0] }
# p hash_mapped({-5=>['q', 'r', 's'], 6=>['w', 'x']}, first) { |n| n * n }
# # {25=>"q", 36=>"w"}

def counted_characters(s)
 a = []
 h = {}
 s.each_char do |e|
  if h[e]
    h[e] += 1
  else
    h[e] = 1
  end
 end
 h.each_key { |k| a.push(k) if h[k] > 2 && !a.include?(k)}
 a
end
# Write a method counted_characters that accepts a string as an argument. The method should return an array containing the characters of the string that appeared more than twice. The characters in the output array should appear in the same order they occur in the input string.

# Examples

# p counted_characters("that's alright folks") # ["t"]
# p counted_characters("mississippi") # ["i", "s"]
# p counted_characters("hot potato soup please") # ["o", "t", " ", "p"]
# p counted_characters("runtime") # []

def triplet_true?(s)
  c = 1
  s.each_char.with_index do |char, i|
    c = 1 if char != s[i + 1]
    c += 1 if char == s[i + 1]
    return true if c == 3
  end
  false
end
# Write a method triplet_true? that accepts a string as an argument and returns a boolean indicating whether or not the string contains three of the same character consecutively.

# Examples

# p triplet_true?('caaabb')        # true
# p triplet_true?('terrrrrible')   # true
# p triplet_true?('runninggg')     # true
# p triplet_true?('bootcamp')      # false
# p triplet_true?('e')             # false

def energetic_encoding(s, h)
  s1 = ''
  s.each_char do |c|
    if h[c]
      s1 += h[c] 
    elsif !h[c] && c != ' '
      s1 += '?'
    else
      s1 += ' '
    end
  end
  s1
end
# Write a method energetic_encoding that accepts a string and a hash as arguments. The method should return a new string where characters of the original string are replaced with the corresponding values in the hash. If a character is not a key of the hash, then it should be replaced with a question mark ('?'). Space characters (' ') should remain unchanged.

# Examples

# p energetic_encoding('sent sea',
#     'e'=>'i', 's'=>'z', 'n'=>'m', 't'=>'p', 'a'=>'u'
# ) # 'zimp ziu'

# p energetic_encoding('cat',
#     'a'=>'o', 'c'=>'k'
# ) # 'ko?'

# p energetic_encoding('hello world',
#     'o'=>'i', 'l'=>'r', 'e'=>'a'
# ) # '?arri ?i?r?'

# p energetic_encoding('bike', {}) # '????'

def uncompress(s)
  s1 = ''
  s.each_char.with_index do |c, i|
    if i.odd?
      c.to_i.times { s1 += s[i - 1]}
    end
  end
  s1
end
# Write a method uncompress that accepts a string as an argument. The string will be formatted so every letter is followed by a number. The method should return an "uncompressed" version of the string where every letter is repeated multiple times given based on the number that appears directly after the letter.

# Examples

# p uncompress('a2b4c1') # 'aabbbbc'
# p uncompress('b1o2t1') # 'boot'
# p uncompress('x3y1x2z4') # 'xxxyxxzzzz'

# Phase 2: More difficult, maybe?
def conjunct_select(a, *p)
  a2 = []
  a.each do |e|
    a2.push(e) if p.all? { |prc| prc.call(e) }
  end
  a2
end
# Write a method conjunct_select that accepts an array and one or more procs as arguments. The method should return a new array containing the elements that return true when passed into all of the given procs.

# Examples

# is_positive = Proc.new { |n| n > 0 }
# is_odd = Proc.new { |n| n.odd? }
# less_than_ten = Proc.new { |n| n < 10 }

# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive) # [4, 8, 11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd) # [11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd, less_than_ten) # [7]

def convert_pig_latin(s)
  s1 = []
  v = 'AEIOUaeiou'
  a = s.split
  a.each do |e|
    if e.length < 3
      s1.push(e)
    elsif v.include?(e[0])
      s1.push(e + 'yay')
    else
      e.each_char.with_index do |c, i|
        if v.include?(c)
          n = e.slice(i..-1) + e.slice(0...i) + 'ay'
          if e[0] == e[0].upcase
            n[0] = n[0].upcase
          end
          s1.push(n)
          break
        end
      end
    end
  end
  s1.join(' ')
end
# Write a method convert_pig_latin that accepts a sentence as an argument. The method should translate the sentence according to the following rules:

# words that are shorter than 3 characters are unchanged
# words that are 3 characters or longer are translated according to the following rules:
# if the word begins with a vowel, simply add 'yay' to the end of the word (example: 'eat'->'eatyay')
# if the word begins with a non-vowel, move all letters that come before the word's first vowel to the end of the word and add 'ay' (example: 'trash'->'ashtray')
# Note that if words are capitalized in the original sentence, they should remain capitalized in the translated sentence. Vowels are the letters a, e, i, o, u.

# Examples

# p convert_pig_latin('We like to eat bananas') # "We ikelay to eatyay ananasbay"
# p convert_pig_latin('I cannot find the trash') # "I annotcay indfay ethay ashtray"
# p convert_pig_latin('What an interesting problem') # "Atwhay an interestingyay oblempray"
# p convert_pig_latin('Her family flew to France') # "Erhay amilyfay ewflay to Ancefray"
# p convert_pig_latin('Our family flew to France') # "Ouryay amilyfay ewflay to Ancefray"

def reverberate(s)
  v = 'AEIOUaeiou'
  a = s.split
  a.map! do |e|
    if e.length < 3
      e
    elsif v.include?(e[-1])
      e + e.downcase
    else
      i = e.length - 1
      t = e
      while i >= 0
        if v.include?(e[i])
          t += t.slice(i..-1)
          if e[0] == e[0].upcase
            t[0].upcase!
          end
          break
        end
        i -= 1
      end
      t
    end
  end
  a.join(' ')
end
# Write a method reverberate that accepts a sentence as an argument. The method should translate the sentence according to the following rules:

# words that are shorter than 3 characters are unchanged
# words that are 3 characters or longer are translated according to the following rules:
# if the word ends with a vowel, simply repeat the word twice (example: 'like'->'likelike')
# if the word ends with a non-vowel, repeat all letters that come after the word's last vowel, including the last vowel itself (example: 'trash'->'trashash')
# Note that if words are capitalized in the original sentence, they should remain capitalized in the translated sentence. Vowels are the letters a, e, i, o, u.

# Examples

# p reverberate('We like to go running fast') # "We likelike to go runninging fastast"
# p reverberate('He cannot find the trash') # "He cannotot findind thethe trashash"
# p reverberate('Pasta is my favorite dish') # "Pastapasta is my favoritefavorite dishish"
# p reverberate('Her family flew to France') # "Herer familyily flewew to Francefrance"

def disjunct_select(a, *p)
  a2 = []
  a.each do |e|
    a2.push(e) if p.any? { |prc| prc.call(e)}
  end
  a2
end
# Write a method disjunct_select that accepts an array and one or more procs as arguments. The method should return a new array containing the elements that return true when passed into at least one of the given procs.

# Examples

# longer_four = Proc.new { |s| s.length > 4 }
# contains_o = Proc.new { |s| s.include?('o') }
# starts_a = Proc.new { |s| s[0] == 'a' }

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
# ) # ["apple", "teeming"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o
# ) # ["dog", "apple", "teeming", "boot"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o,
#     starts_a
# ) # ["ace", "dog", "apple", "teeming", "boot"]

def alternating_vowel(s)
  s2 = []
  v = 'AEIOUaeiou'
  a = s.split
  a.each.with_index do |e, i|
    if i.even?
      t = e
      j = 0
      while j <= e.length - 1
        if v.include?(e[j])
          t = e.slice(0...j) + e.slice(j+1..-1)
          break
        end
        j += 1
      end
      s2.push(t)
    else
      t = e
      k = e.length - 1
      while k >= 0
        if v.include?(e[k])
          t = e.slice(0...k) + e.slice(k+1..-1)
          break
        end
        k -= 1
      end
      s2.push(t)
    end
  end
  s2.join(' ')
end
# Write a method alternating_vowel that accepts a sentence as an argument. The method should return a new sentence where the words alternate between having their first or last vowel removed. For example:

# the 1st word should be missing its first vowel
# the 2nd word should be missing its last vowel
# the 3rd word should be missing its first vowel
# the 4th word should be missing its last vowel
# ... and so on
# Note that words that contain no vowels should remain unchanged. Vowels are the letters a, e, i, o, u.

# Examples

# p alternating_vowel('panthers are great animals') # "pnthers ar grat animls"
# p alternating_vowel('running panthers are epic') # "rnning panthrs re epc"
# p alternating_vowel('code properly please') # "cde proprly plase"
# p alternating_vowel('my forecast predicts rain today') # "my forecst prdicts ran tday"

def silly_talk(s)
  v = 'AEIOUaeiou'
  s1 = []
  a = s.split
  a.each do |e|
    if v.include?(e[-1])
      s1.push(e + e[-1])
    else
      nw = ''
      e.each_char.with_index do |c, i|
        if v.include?(c)
          nw += (c + 'b' + c.downcase)
        else
          nw += c
        end
      end
      s1.push(nw)
    end
  end
  s1.join(' ')
end
# Write a method silly_talk that accepts a sentence as an argument. The method should translate each word of the sentence according to the following rules:

# if the word ends with a vowel, simply repeat that vowel at the end of the word (example: 'code'->'codee')
# if the word ends with a non-vowel, every vowel of the word should be followed by 'b' and that same vowel (example: 'siren'->'sibireben')
# Note that if words are capitalized in the original sentence, they should remain capitalized in the translated sentence. Vowels are the letters a, e, i, o, u.

# Examples

# p silly_talk('Kids like cats and dogs') # "Kibids likee cabats aband dobogs"
# p silly_talk('Stop that scooter') # "Stobop thabat scobooboteber"
# p silly_talk('They can code') # "Thebey caban codee"
# p silly_talk('He flew to Italy') # "Hee flebew too Ibitabaly"

def compress(s)
  s1 = ''
  counter = 1
  s.each_char.with_index do |c, i|
    if c == s[i+1]
      counter += 1
    else
      if counter > 1
        s1 += c
        s1 += counter.to_s
        counter = 1
      else
        s1 += c
      end
    end
  end
  s1
end
# Write a method compress that accepts a string as an argument. The method should return a "compressed" version of the string where streaks of consecutive letters are translated to a single appearance of the letter followed by the number of times it appears in the streak. If a letter does not form a streak (meaning that it appears alone), then do not add a number after it.

# Examples

# p compress('aabbbbc')   # "a2b4c"
# p compress('boot')      # "bo2t"
# p compress('xxxyxxzzzz')# "x3yx2z4"
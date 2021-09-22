require_relative "player"

class HumanPlayer < Player

  def get_move
    move = []
    puts "Please enter the position of piece you want to move (ex: e2)"
    input = gets.chomp
    move << translate(input)
    puts "Please enter the position of square you want to move to (ex: e4)"
    input = gets.chomp
    move << translate(input)
    move
  end

  def translate(str)
    temp = str.split('')
    result = []
    case temp[0]
    when "a"
      result << 0
    when "b"
      result << 1
    when "c"
      result << 2
    when "d"
      result << 3
    when "e"
      result << 4
    when "f"
      result << 5
    when "g"
      result << 6
    when "h"
      result << 7
    end
    result << temp[1].to_i - 1
    result.reverse
  end

end
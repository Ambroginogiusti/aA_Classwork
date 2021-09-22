class Piece

  attr_accessor :pos, :color, :note, :moves

  def initialize(color, pos)
    @color = color
    @pos = pos
    @moves = []
  end

  def translate(pos)
    result = ""
    row, col = pos
    case col
    when 0
      result << "a"
    when 1
      result << "b"
    when 2
      result << "c"
    when 3
      result << "d"
    when 4
      result << "e"
    when 5
      result << "f"
    when 6
      result << "g"
    when 7
      result << "h"
    end
  result << (row + 1).to_s
  result
  end

end
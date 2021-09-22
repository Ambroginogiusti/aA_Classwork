class Piece

  attr_accessor :pos, :color, :note, :moves

  def initialize(color, pos)
    @color = color
    @pos = pos
    @moves = []
  end

end
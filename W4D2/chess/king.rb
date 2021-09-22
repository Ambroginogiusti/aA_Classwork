require_relative "piece"

class King < Piece

  def initialize(color, pos)
    super
    @note = color + "K"
  end

  def possible_squares
    moves = []
    (-1..1).each do |i|
      (-1..1).each do |j|
        if i <= j
          moves << [@pos[0]+i,@pos[1]+j]
        end
      end
    end
    moves
  end

end
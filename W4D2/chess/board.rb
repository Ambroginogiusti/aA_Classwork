require_relative "piece"

class Board

  attr_accessor :grid

  def initialize
    @grid = Array.new(8) {Array.new(8)}
  end

  def move_piece(start_pos, end_pos)

  end

  def set_pieces
    self.grid[0][0] = Rook.new(:white, [0,0])
    self.grid[0][7] = Rook.new(:white, [0,7])
    self.grid[0][1] = Knight.new(:white, [0,1])
    self.grid[0][6] = Knight.new(:white, [0,6])
    self.grid[0][2] = Bishop.new(:white, [0,2])
    self.grid[0][5] = Bishop.new(:white, [0,5])
    self.grid[0][3] = Queen.new(:white, [0,3])
    self.grid[0][4] = King.new(:white, [0,5])
    self.grid[7][0] = Rook.new(:black, [7,0])
    self.grid[7][7] = Rook.new(:black, [7,7])
    self.grid[7][1] = Knight.new(:black, [7,1])
    self.grid[7][6] = Knight.new(:black, [7,6])
    self.grid[7][2] = Bishop.new(:black, [7,2])
    self.grid[7][5] = Bishop.new(:black, [7,5])
    self.grid[7][3] = Queen.new(:black, [7,3])
    self.grid[7][4] = King.new(:black, [7,5])
    (0..7).each do |i|
      self.grid[1][i] = Pawn.new(:white, [1, i])
      self.grid[6][i] = Pawn.new(:black, [6, i])
    end
  end

end
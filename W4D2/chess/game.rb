require_relative "board"

class Game

  attr_accessor :board

  def initialize
    @board = Board.new
  end

  def play
    render
  end

  def render
    (0..7).reverse_each do |row|
      (0..7).each do |col|
        if self.board[[row, col]] != nil
          print " " + self.board[[row, col]].note + " "
        else
          print "    "
        end
      end
      puts
    end
  end

end

game = Game.new
game.play
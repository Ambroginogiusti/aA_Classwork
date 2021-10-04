require_relative "card"

class Board
  LETTERS = ('A'..'Z').to_a

  attr_reader :grid, :size

  def initialize(size)
    @grid = Array.new(size) { Array.new(size) }
    @size = size
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, val)
    row, col = pos
    @grid[row][col] = val
  end

  def populate
    random_letters = LETTERS.dup.shuffle
    while @grid.flatten.any?(nil)
      letter = random_letters.pop
      j = 0
      while j < 2
        row = rand(0...@grid.length)
        col = rand(0...@grid.length)
        if @grid[row][col] == nil
          @grid[row][col] = letter
          j += 1
        else
          next
        end
      end
    end
  end

  def render
    @grid.each do |row|
      puts row.join(' ')
    end
  end

end
class Board

  def self.print_grid(grid)
    grid.each do |row|
      puts row.join(' ')
    end
  end

  def initialize(n)
    @grid = Array.new(n) {Array.new(n, :N)}
    @size = n * n
  end

  def size
    @size
  end

  def [](pos)
    r, c = pos
    @grid[r][c]
  end

  def []=(pos, val)
    r, c = pos
    @grid[r][c] = val
  end

  def num_ships
    count = 0
    @grid.each do |row|
      row.each do |pos|
        count += 1 if pos == :S
      end
    end
    count
  end

  def attack(pos)
    if self[pos] == :S
      self[pos] = :H
      puts 'you sunk my battleship!'
      return true
    else
      self[pos] = :X
      return false
    end
  end

  def place_random_ships
    ships = self.size / 4
    while self.num_ships < ships
      row = rand(0...@grid.length)
      col = rand(0...@grid.length)
      pos = [row, col]
      self[pos] = :S
    end
  end

  def hidden_ships_grid
    @grid.map do |row|
      row.map do |pos|
        if pos == :S
          :N
        else
          pos
        end
      end
    end
  end

  def cheat
    Board.print_grid(@grid)
  end

  def print
    Board.print_grid(self.hidden_ships_grid)
  end

end

class Board 

  def initialize(n)
    @grid = Array.new(n) {Array.new(n, '_')}
    print
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, mark)
    row, col = pos
    @grid[row][col] = mark
  end

  def valid?(pos)
    if (pos[0] >= 0 && pos[0] < @grid.size) && (pos[1] >= 0 && pos[1] < @grid.size)
      return true
    else
      false
    end
  end

  def empty?(pos)
    self[pos] == '_'
  end

  def place_mark(pos, mark)
    if !self.valid?(pos)
      raise "pos not valid!"
    elsif !self.empty?(pos)
      raise "pos not empty!"
    else
      self[pos] = mark
      puts
      self.print
      puts
      mark
    end
  end

  def print
    @grid.each do |row|
      puts row.join(' ')
    end
  end

  def win_row?(mark)
    @grid.any? do |row|
      row.all? do |el|
        el == mark
      end
    end
  end

  def win_col?(mark)
    @grid.transpose.any? do |row|
      row.all? do |el|
        el == mark
      end
    end
  end

  def win_diagonal?(mark)
    count = 0
    i = 0
    while i < @grid.size
      count += 1 if @grid[i][i] == mark
      i += 1
    end
    return true if count == @grid.size
    count = 0
    i = 0
    j = @grid.size - 1
    while i < @grid.size
      count += 1 if @grid[i][j] == mark
      i += 1
      j -= 1
    end
    return true if count == @grid.size
    false
  end

  def win?(mark)
    self.win_row?(mark) || self.win_col?(mark) || self.win_diagonal?(mark)
  end

  def empty_positions?
    @grid.each do |row|
      row.each do |el|
        return true if el == '_'
      end
    end
    false
  end

  def legal_positions
    legal = []
    @grid.each.with_index do |row, i|
      row.each.with_index do |el, j|
        legal.push([i, j]) if el == "_"
      end
    end
    legal
  end

end
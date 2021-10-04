class HumanPlayer

  def initialize(mark)
    @mark = mark
  end
  
  def mark
    @mark
  end
  
  def get_position
    puts "Players #{self.mark.to_s}: enter two numbers with a space between (e.g. 0 0)"
    pos = gets.chomp.split.map(&:to_i)
    raise "incorrect entry" if pos.length != 2
    pos
  end

end
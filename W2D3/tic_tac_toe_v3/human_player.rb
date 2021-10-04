class HumanPlayer

  def initialize(mark)
    @mark = mark
  end
  
  def mark
    @mark
  end
  
  def get_position(legal_positions)
    good_choice = false
    while !good_choice
      good_choice = true
      puts "Players #{self.mark.to_s}: enter two numbers with a space between (e.g. 0 0)"
      pos = gets.chomp.split.map(&:to_i)
      raise "incorrect entry" if pos.length != 2
      if !legal_positions.include?(pos)
        good_choice = false
        puts "not a legal position, try again..."
      end
    end
    pos
  end

end
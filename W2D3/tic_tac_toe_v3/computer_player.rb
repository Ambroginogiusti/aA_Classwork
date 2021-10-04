class ComputerPlayer

  def initialize(mark)
    @mark = mark
  end

  def mark
    @mark
  end

  def get_position(legal_positions)
    comp_play = legal_positions[rand(legal_positions.length)]
    puts "computer #{self.mark.to_s} plays #{comp_play.to_s}"
    comp_play
  end

end
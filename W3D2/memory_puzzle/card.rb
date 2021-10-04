class Card
    LETTERS = ('A'..'Z').to_a

    attr_reader :face_value 

  def initialize(face_value)
    @face_value = face_value
    @face_up = false
  end

  def hide
    @face_up = false
  end

  def reveal
    @face_up = true
  end

  def ==(a, b)
    if a == b
      self.reveal
    else
      self.hide
    end
  end

end
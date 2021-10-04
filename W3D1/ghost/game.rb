class Game

  LETTERS = %w(G H O S T)

  def initialize
    @players
    @fragment
    @dictionary = # dictionary.txt
    @current_player = @players[0]
  end

  def current_player
    @current_player
  end

  def previous_player
    @players.select { |el| el != @current_player }
  end

  def next_player!
    @current_player = self.previous_player
  end

  def take_turn(player)
    input = player.guess
    if valid_play?(input)
      @fragment += input
      if @dictionary.include?(@fragment)
        # @current_player gets next letter in GHOST
      end
    end
  end

  def valid_play?(string)
    alpha = ('a'..'z').to_a
    return false if !alpha.include?(string.downcase)
    test = @fragment + string
    return false if !dictionary.include(test.downcase)
    true
  end

  def play_round
    self.take_turn(player)
  end

end
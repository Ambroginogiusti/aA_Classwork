require_relative "board.rb"
require_relative "human_player.rb"

class Game

  def initialize(n, *players)
    @players = players.map { |mark| HumanPlayer.new(mark) }
    @current_player = @players[0]
    @board = Board.new(n)
  end

  def switch_turn
    @players.rotate!
    @current_player = @players[0]
  end

  def play
    while @board.empty_positions?
      @board.print
      pos = @current_player.get_position
      @board.place_mark(pos, @current_player.mark)
      if @board.win?(@current_player.mark)
        puts "Congrats #{@current_player.mark}, you a winner!"
        return
      else
        self.switch_turn
      end
    end
    puts "DRAW!"
  end

end
require_relative "board"
require_relative "human_player"
require_relative "player"

class Game

  attr_accessor :board, :player_one, :player_two, :game_over, :current_player

  def initialize(name)
    @board = Board.new
    @player_one = HumanPlayer.new("w", name)
    @player_two = HumanPlayer.new("b", "Computer")
    @game_over = false
    @current_player = @player_one
  end

  def play
    while !game_over
      render
      current_move = @current_player.get_move
      p current_move
      until valid_piece?(current_move[0])
        puts "Invalid move. Enter again."
        current_move = @current_player.get_move
        p current_move
      end
      current_piece = grab_piece(current_move[0])
      place_piece(current_move[1], current_piece)
      change_player
    end
  end

  def grab_piece(pos)
    piece = @board[pos]
    @board[pos] = nil
    piece
  end

  def place_piece(pos, piece)
    @board[pos] = piece
  end

  def valid_piece?(pos)
    if @current_player.color == @board[pos].color
      return true
    else 
      return false
    end
  end

  def change_player
    if @current_player == @player_one
      @current_player = @player_two
    else
      @current_player = @player_one
    end
  end

  def render
    (0..7).reverse_each do |row|
      (0..7).each do |col|
        pos = [row, col]
        if self.board[pos] != nil
          print " " + self.board[pos].note + " "
        else
          print "    "
        end
      end
      puts
    end
  end

end

game = Game.new("Human")
game.play
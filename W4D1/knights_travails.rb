require_relative "poly_tree_node"

class KnightPathFinder

  attr_accessor :root_node

  def self.valid_moves(pos)
    valid_moves = []
    row, col = pos
    all_moves = [[1, 2], [1, -2], [-1, 2], [-1, -2], [2, 1], [2, -1], [-2, 1], [-2, -1]]
    all_moves.each do |position|
      new_position = [row + position.first, col + position.last]
      if (new_position.first >= 0 && new_position.first <= 7) && (new_position.last >= 0 && new_position.last <= 7)
        valid_moves.push(new_position)
      end
    end
    valid_moves
  end

  def initialize(pos)
    @considered_positions = [pos]
    @root_node = PolyTreeNode.new(pos)
    build_move_tree
  end

  def build_move_tree
    array = []
    array << @root_node
    until array.empty?
      node = array.shift
      new_move_positions(node.value).each_with_index do |move, i|
        new_node = PolyTreeNode.new(move)
        node.add_child(new_node)
        array << new_node
      end

    end
  end

  def new_move_positions(pos)
    new_pos = KnightPathFinder.valid_moves(pos).select do |el|
      !@considered_positions.include?(el)
    end
    @considered_positions += new_pos
  end

end

my_knight = KnightPathFinder.new([0, 0])
p my_knight
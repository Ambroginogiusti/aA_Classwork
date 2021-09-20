# require "byebug"

require_relative "poly_tree_node"

class KnightPathFinder

  attr_accessor :root_node, :considered_positions

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
      new_move_positions(node.value).each do |move|
        new_node = PolyTreeNode.new(move)
        # debugger
        # new_node.considered_positions += node.value
        node.add_child(new_node)
        array << new_node
      end

    end
  end

  def new_move_positions(pos)
    new_pos = KnightPathFinder.valid_moves(pos).reject do |el|
      @considered_positions.include?(el)
    end
    @considered_positions += new_pos
    new_pos
  end

  def find_path(end_pos)
    node = self.root_node.dfs(end_pos)
    trace_path_back(node)
  end

  def trace_path_back(node)
    path = []
    until node.parent.nil?
      path << node.value
      node = node.parent
    end
    path
  end

end

kpf = KnightPathFinder.new([0, 0])
p kpf.find_path([7, 6]) # => [[0, 0], [1, 2], [2, 4], [3, 6], [5, 5], [7, 6]]
p kpf.find_path([6, 2]) # => [[0, 0], [1, 2], [2, 0], [4, 1], [6, 2]]
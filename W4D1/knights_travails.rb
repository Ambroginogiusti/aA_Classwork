require_relative "poly_tree_node"

class KnightPathFinder

  def self.valid_moves(pos)
    
  end

  def initialize(pos)
    @considered_positions = [pos]
    @root_node = PolyTreeNode.new(pos)
    build_move_tree
  end

  def build_move_tree

  end

  def new_move_positions(pos)
    KnightPathFinder.valid_moves(pos).select do |el|
      
    end
  end

end


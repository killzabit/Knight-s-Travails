# frozen_string_literal:true

# node class, adj_nodes is similar to adjancency list.

class Node
  attr_accessor :data, :adj_nodes

  def initialize(data)
    @data = data
    @adj_nodes = []
  end

  def add_node(node)
    @adj_nodes << node
  end
end

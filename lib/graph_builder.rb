# frozen_string_literal:true

require './lib/node.rb'
require './lib/move_finder.rb'
require './lib/graph_traverser.rb'

# creates a graph using the array of moves created by move_finder
# the coords_array is used to make the array of vertices and then
# start_destination() finds the nodes for the start and destination
class GraphBuilder
  attr_accessor :vertices_array, :move_finder, :sorted_coords, :possible_moves, :start, :destination

  def initialize(start, destination)
    @sorted_coords = coords_array.sort
    @move_finder = MoveFinder.new
    @vertices_array = []
    @possible_moves = []
    @edges = []
    @start = start
    @destination = destination
    @traverser = GraphTraverser.new
  end

  def coords_array
    [
    [0, 7], [1, 7], [2, 7], [3, 7], [4, 7], [5, 7], [6, 7], [7, 7],
    [0, 6], [1, 6], [2, 6], [3, 6], [4, 6], [5, 6], [6, 6], [7, 6],
    [0, 5], [1, 5], [2, 5], [3, 5], [4, 5], [5, 5], [6, 5], [7, 5],
    [0, 4], [1, 4], [2, 4], [3, 4], [4, 4], [5, 4], [6, 4], [7, 4],
    [0, 3], [1, 3], [2, 3], [3, 3], [4, 3], [5, 3], [6, 3], [7, 3],
    [0, 2], [1, 2], [2, 2], [3, 2], [4, 2], [5, 2], [6, 2], [7, 2],
    [0, 1], [1, 1], [2, 1], [3, 1], [4, 1], [5, 1], [6, 1], [7, 1],
    [0, 0], [1, 0], [2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0]
    ]
  end

  def run
    create_graph
    start_destination
    @traverser.find_steps
    @traverser.find_destination_position
    @traverser.find_path
    @traverser.path_converter
    @traverser.path_print
  end

  def create_graph
    create_vertices_array
    @vertices_array.each do |i|
      adj_nodes_list(i)
    end
    nil
  end

  def create_vertices_array
    @sorted_coords.each do |i|
      @vertices_array << Node.new(i) 
    end
  end

  def possible_moves_to_nodes
    @possible_moves.each do |i|
      @edges << find_node(@vertices_array, i)
    end
  end

  def adj_nodes_list(node)
    @possible_moves = @move_finder.find_all_moves(node.data)
    possible_moves_to_nodes
    while !@edges.empty?
      node.add_node(@edges[0]) unless @edges[0].nil?
      @edges.shift
    end
  end

  def start_destination
    @start = find_node(@vertices_array, @start)
    @destination = find_node(@vertices_array, @destination)
    start_destination_assigner
  end

  def start_destination_assigner
    @traverser.start = @start
    @traverser.destination = @destination
  end

  def find_node(arr, value, start = 0, endarr = arr.length - 1)
    mid = (start + endarr) / 2
    if start > endarr
      puts "This node does not exist \n "
    else
      case value <=> arr[mid].data
      when -1
        find_node(arr, value, start, mid - 1)
      when 0
        arr[mid]
      when 1
        find_node(arr, value, mid + 1, endarr)
      end
    end
  end
end

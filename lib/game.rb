require './lib/chess_board.rb'
require './lib/graph_builder.rb'
require './lib/knight.rb'

# frozen_string_literal:true

# runs the game/simulation. graph gets assigned to be a graph_builder.

class Game
  def initialize
    @knight = Knight.new
    @graph
    @board = Chess_Board.new
  end

  def run
    @board.display
    @knight.run
    @knight.report_position_destination
    @graph = Graph_Builder.new @knight.knight_position, @knight.destination
    @graph.run
    new_destination
  end

  def welcome
    puts "Welcome to Knights Travails.\n"
    sleep 1
    puts "The simulation will now begin!\n"
    sleep 1
  end

  def new_destination
    puts "Would you like to choose a new destination?\n"
    sleep 1
    puts "Type 'yes' to continue or 'no' to exit\n"
    a = gets.chomp
    abort '!!Exiting simulation!!' if a == 'no'
    run if a == 'yes'
  end
end

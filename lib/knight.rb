require './lib/chess_board.rb'
require './lib/move_finder.rb'


# frozen_string_literal:true

# represents the knight piece, uses move_finder.rb to find the moves
# that the knight can currently make.

class Knight
  attr_reader :chess_board
  attr_accessor :knight_position, :possible_moves

  def initialize
    @knight_position = [3, 3]
    @chess_board = Chess_Board.new
    @move_finder = MoveFinder.new @knight_position
  end

  def generate_move_list
    @move_finder.find_all_moves
  end

  def move_knight
    @knight_position = @move_finder.possible_moves.sample
    @move_finder.piece_position = @knight_position
    @move_finder.find_all_moves
    show_moves_list
    @knight_position
  end

  def show_moves_list
    print @move_finder.possible_moves
  end

 

  
  
end
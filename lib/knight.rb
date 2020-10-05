require './lib/chess_board.rb'

# frozen_string_literal:true

class Knight
  attr_reader :chess_board
  attr_accessor :knight_position, :possible_moves

  def initialize
    @knight_position = [3, 1]
    @chess_board = Chess_Board.new
    @possible_moves = []
  end

  def find_all_moves
    @possible_moves.clear
    find_up_moves
    find_down_moves
    find_left_moves
    find_right_moves
  end

  def clean_possible_moves
    @possible_moves.select! { |a| a.all? { |i| !i.negative?}}
  end

  def find_left_moves
    a = @knight_position.dup
    a[0] -= 2
    a[1] += 1
    @possible_moves << a
    a = @knight_position.dup
    a[0] -= 2
    a[1] -= 1
    @possible_moves << a
  end

  def find_right_moves
    a = @knight_position.dup
    a[0] += 2
    a[1] += 1
    @possible_moves << a
    a = @knight_position.dup
    a[0] += 2
    a[1] -= 1
    @possible_moves << a
  end

  def find_down_moves
    a = @knight_position.dup
    a[1] -= 2
    a[0] += 1
    @possible_moves << a
    a = @knight_position.dup
    a[1] -= 2
    a[0] -= 1
    @possible_moves << a
  end

  def find_up_moves
    a = @knight_position.dup
    a[1] += 2
    a[0] += 1
    @possible_moves << a
    a = @knight_position.dup
    a[1] += 2
    a[0] -= 1
    @possible_moves << a
  end

  
  
end
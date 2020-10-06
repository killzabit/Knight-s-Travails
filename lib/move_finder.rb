
# frozen_string_literal:true

# finds moves of knight, can be refactored to find moves of any piece
# takes the piece and an array in which to store all possible moves

class MoveFinder
  attr_accessor :possible_moves, :piece_position
  def initialize(piece_position)
    @piece_position = piece_position
    @possible_moves = []  
  end

  def find_all_moves
    @possible_moves.clear
    find_up_moves
    find_down_moves
    find_left_moves
    find_right_moves
    clean_possible_moves
  end

  def clean_possible_moves
    @possible_moves.select! { |a| a.all? { |i| !i.negative?}}
    @possible_moves.select! { |a| a.all? { |i| !(i > 8)}}
  end

  def find_left_moves
    a = @piece_position.dup
    a[0] -= 2
    a[1] += 1
    @possible_moves << a
    a = @piece_position.dup
    a[0] -= 2
    a[1] -= 1
    @possible_moves << a
  end

  def find_right_moves
    a = @piece_position.dup
    a[0] += 2
    a[1] += 1
    @possible_moves << a
    a = @piece_position.dup
    a[0] += 2
    a[1] -= 1
    @possible_moves << a
  end

  def find_down_moves
    a = @piece_position.dup
    a[1] -= 2
    a[0] += 1
    @possible_moves << a
    a = @piece_position.dup
    a[1] -= 2
    a[0] -= 1
    @possible_moves << a
  end

  def find_up_moves
    a = @piece_position.dup
    a[1] += 2
    a[0] += 1
    @possible_moves << a
    a = @piece_position.dup
    a[1] += 2
    a[0] -= 1
    @possible_moves << a
  end
end
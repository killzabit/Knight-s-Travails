# frozen_string_literal:true

class Chess_Board
  attr_reader :knight, :spaces, :coords_board
  def initialize
    @spaces
    @coords_board
    @green = "\e[48;5;28m    \e[0m"
    @grey = "\e[48;5;243m    \e[0m"
  end

  def create_spaces_array
    a = ('a'..'h').to_a
    b = ('1'..'8').to_a
    @spaces = a.product b
  end

  def coords_board
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

  def display
    puts <<-HEREDOC
            #{@green}#{@grey}#{@green}#{@grey}#{@green}#{@grey}#{@green}#{@grey}
          8 #{@green}#{@grey}#{@green}#{@grey}#{@green}#{@grey}#{@green}#{@grey}
            #{@grey}#{@green}#{@grey}#{@green}#{@grey}#{@green}#{@grey}#{@green}
          7 #{@grey}#{@green}#{@grey}#{@green}#{@grey}#{@green}#{@grey}#{@green}
            #{@green}#{@grey}#{@green}#{@grey}#{@green}#{@grey}#{@green}#{@grey}
          6 #{@green}#{@grey}#{@green}#{@grey}#{@green}#{@grey}#{@green}#{@grey}
            #{@grey}#{@green}#{@grey}#{@green}#{@grey}#{@green}#{@grey}#{@green}
          5 #{@grey}#{@green}#{@grey}#{@green}#{@grey}#{@green}#{@grey}#{@green}
            #{@green}#{@grey}#{@green}#{@grey}#{@green}#{@grey}#{@green}#{@grey}
          4 #{@green}#{@grey}#{@green}#{@grey}#{@green}#{@grey}#{@green}#{@grey}
            #{@grey}#{@green}#{@grey}#{@green}#{@grey}#{@green}#{@grey}#{@green}
          3 #{@grey}#{@green}#{@grey}#{@green}#{@grey}#{@green}#{@grey}#{@green}
            #{@green}#{@grey}#{@green}#{@grey}#{@green}#{@grey}#{@green}#{@grey}
          2 #{@green}#{@grey}#{@green}#{@grey}#{@green}#{@grey}#{@green}#{@grey}
            #{@grey}#{@green}#{@grey}#{@green}#{@grey}#{@green}#{@grey}#{@green}
          1 #{@grey}#{@green}#{@grey}#{@green}#{@grey}#{@green}#{@grey}#{@green}
             a   b   c   d   e   f   g   h

    HEREDOC
  end
end

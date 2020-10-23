# frozen_string_literal:true

# this is the chess board display

class Chess_Board
  def initialize
    @green = "\e[48;5;28m    \e[0m"
    @grey = "\e[48;5;243m    \e[0m"
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
      
             Here is a chess board for you to reference.
             Knight position is d4.

    HEREDOC
  end
end

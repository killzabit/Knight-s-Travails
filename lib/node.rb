
# frozen_string_literal:true


class Node
  def initialize(data, up = nil, down = nil, left = nil, right = nil)
    @data = data
    @up = up
    @down = down
    @left = left
    @right = right
  end
end
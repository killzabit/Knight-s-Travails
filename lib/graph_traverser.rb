
# can traverse graph and print out the path taken to destination node
# find_steps walk through BFS style to find how long it took to get to dest.
# find_path fills in the path array so path_print can print it to screen
class GraphTraverser
  attr_accessor :start, :destination
  def initialize
    @start
    @destination
    @d_pos
    @to_be_pathed = []
    @path = []
  end

  def find_steps
    q = []
    q << @start
    vis = []
    steps = 0
    while !q.empty?
      current_node = q[0]
      if current_node == @destination
        steps += 1
        break
      elsif current_node == 'step'
        steps += 1
        q.shift
      else
        q[0].adj_nodes.each do |i|
          if !q.include?(i) && !vis.include?(i)
            q << i
            @to_be_pathed << [q[0], i]
            q << 'step' unless q.include?('step')
          end
        end
        vis << q[0]
        q.shift
      end
    end
    puts "Made it in #{steps} steps. \n "
  end

  # d_pos is destination position, would have to change find_node
  # in order to use it for this case, would overcomplicate the find_node method

  def find_destination_position
    @d_pos = @to_be_pathed.find_index do |i|
      i[1] == @destination
    end
  end

  def find_path
    current_pos = @to_be_pathed[@d_pos]
    loop do
      @path << current_pos[1].data
      if current_pos[0] == @start
        break
      end
      x = @to_be_pathed.find_index do |i|
        i[1] == current_pos[0] unless current_pos[0] == @start
      end
      current_pos = @to_be_pathed[x]
    end
    @path << @start.data
  end

  def path_converter
    @path.each do |i|
      case i[0]
      when 0
        i[0] = 'a'
      when 1
        i[0] = 'b'
      when 2
        i[0] = 'c'
      when 3
        i[0] = 'd'
      when 4
        i[0] = 'e'
      when 5
        i[0] = 'f'
      when 6
        i[0] = 'g'
      when 7
        i[0] = 'h'
      end
      i[1] += 1
    end
  end

  def path_print
    x = ''
    @path = @path.reverse
    @path.each do |i|
      i = i.join
      if i == 'd4'
        x << "#{i} >> "
      elsif i == @path[-1].join
        x << "#{i} \n "
      else
        x << "#{i} >> "
      end
    end
    puts x
  end
end

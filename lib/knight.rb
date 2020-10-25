# frozen_string_literal:true

# represents the knight piece, gets destination but has a default start value   # that can be updated
class Knight
  attr_accessor :knight_position, :destination, :reportable_position, :reportable_destination

  def initialize
    @knight_position = [3, 3]
    @destination
    @reportable_position
    @reportable_destination
  end

  def run
    ask_destination
    destination_converter
  end

  def report_position_destination
    position_converter
    puts "Current knight position is : #{@reportable_position.join} \n "
    puts "Destination set to: #{@reportable_destination} \n "
  end

  private

  def ask_destination
    puts 'Where would you like to move to?'
    puts "You must use this format to choose a new destination, ex: a1 \n "
    @reportable_destination = gets.chomp
    ask_destination_error
  end

  def position_converter
    @reportable_position = @knight_position.dup
    case @reportable_position[0]
    when 0
      @reportable_position[0] = 'a'
    when 1
      @reportable_position[0] = 'b'
    when 2
      @reportable_position[0] = 'c'
    when 3
      @reportable_position[0] = 'd'
    when 4
      @reportable_position[0] = 'e'
    when 5
      @reportable_position[0] = 'f'
    when 6
      @reportable_position[0] = 'g'
    when 7
      @reportable_position[0] = 'h'
    end
    @reportable_position[1] += 1
  end

  def destination_converter
    @destination = @reportable_destination.split(//)
    case @destination[0]
    when 'a'
      @destination[0] = 0
    when 'b'
      @destination[0] = 1
    when 'c'
      @destination[0] = 2
    when 'd'
      @destination[0] = 3
    when 'e'
      @destination[0] = 4
    when 'f'
      @destination[0] = 5
    when 'g'
      @destination[0] = 6
    when 'h'
      @destination[0] = 7
    end
    @destination[1] = @destination[1].to_i
    @destination[1] -= 1
  end

  def ask_destination_error
    a = @reportable_destination.split(//)
    if (!('a'..'h').include? a[0]) || (!('1'..'8').include? a[1])
      puts "Incorrect format used, must follow format. \n "
      ask_destination
    elsif @reportable_destination == 'd4'
      puts "d4 is the starting point! \n "
      ask_destination
    end
  end
end

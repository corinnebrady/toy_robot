class Robot

  COMPASS = {
    "north" => {:left => "west", :right => "east"},
    "west" => {:left => "south", :right => "north"},
    "south" => {:left => "east", :right => "west"},
    "east" => {:left => "north", :right => "south"}
  }

  attr_accessor :x, :y, :direction, :placed

  def initialize
    @on_table = false
  end

  def place(coordinates, direction)
    raise("Those coordinates aren't on the table!") unless valid_coordinate?(coordinates)
    raise("That isn't a good direction, try again and make sure to type out the full word") unless valid_direction?(direction)
    @x = coordinates[:x]
    @y = coordinates[:y]
    @direction = direction
    @on_table = true
  end

  def turn_left
    raise("Don't you think I should be placed on the table first?") unless on_table?
    @direction = COMPASS[@direction][:left]
  end

  def turn_right
    raise("Don't you think I should be placed on the table first?") unless on_table?
    @direction = COMPASS[@direction][:right]
  end

  def move
    raise("Don't you think I should be placed on the table first?") unless on_table?
    if direction == "north"
      raise("No! I must stay on the table!") if @y == 4
      @y += 1
    elsif direction == "east"
      raise("No! I must stay on the table!") if @x == 4
      @x += 1
    elsif direction =="south"
      raise("No! I must stay on the table!") if @y == 0
      @y -= 1
    elsif direction == "west"
      raise("No! I must stay on the table!") if @x == 0
      @x -= 1
    end
  end

  def report
    raise("Don't you think I should be placed on the table first?") unless on_table?
    return "My position is (#{@x}, #{@y}) #{@direction}"
  end

private
  def on_table?
    @on_table == true
  end

  def valid_coordinate?(coordinate)
    coordinate[:x] >= 0 && coordinate[:x] <= 4 && coordinate[:y] >= 0 && coordinate[:y] <= 4
  end

  def valid_direction?(direction)
    ["north", "east", "south", "west"].include?(direction)
  end
end

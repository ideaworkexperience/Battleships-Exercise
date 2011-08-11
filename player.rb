require 'grid'

class Player
  attr_reader :grid, :grid_size, :boats, :num_boats, :shots, :output_whiny_coords
  
  def initialize(grid_size)
    @grid_size = grid_size
    @grid = Grid.new(grid_size)
    @num_boats = BATTLESHIPS::NUM_BOATS
    @boats = []
    @shots = []
  end
  
  def print_grid
    puts self.boats.inspect
    self.grid.print_grid
  end
  
  def alive?
    !self.boats.empty?
  end
  
  def fire_upon(player, x,y)
    player.take_fire(x,y)
  end
  
  def take_fire(x,y)
    coords = [x,y]
    marker = BATTLESHIPS::FIRE_MARKER
    if self.boats.include?(coords)
      self.boats.delete(coords)
      marker = BATTLESHIPS::HIT_MARKER
    end
    self.grid.grid[y-1][x-1] = marker
  end
  
  def get_coords
    unique_coords = false
    while !unique_coords do
      x,y = generate_coords
      coords = [x,y]
      if self.shots.include?(coords)
        puts 'You already fired there, try again!' if output_whiny_coords
      else
        unique_coords = true
      end
    end
    self.shots << coords
    return x,y
  end
end

class HumanPlayer < Player
  def initialize(grid_size)
    @output_whiny_coords = true
    super
  end
  
  def generate_coords
    print 'Input x coordinate: '
    x = gets.to_i
    print 'Input y coordinate: '
    y = gets.to_i
    return x,y
  end
  
  def place_boats
    num_boats.times do |i|
      print "x coord for boat #{i+1}: " 
      x = gets.to_i
      print "y coord for boat #{i+1}: "
      y = gets.to_i
      @boats << [x,y]
    end
  end
end

class ComputerPlayer < Player
  def initialize(grid_size)
    @output_whiny_coords = false
    super
  end
  
  def generate_coords
    x,y = random_coordinates
    
    puts "Computer chooses #{x} for the x coordinate"
    puts "Computer chooses #{y} for the y coordinate"
    return x,y
  end
  
  def place_boats
    num_boats.times do
      x,y = random_coordinates
      @boats << [x,y]
    end
  end
  
  def random_coordinates
    all_coords = [*(1..grid_size)]
    x = all_coords[rand(grid_size)]
    y = all_coords[rand(grid_size)]
    return x,y
  end
end
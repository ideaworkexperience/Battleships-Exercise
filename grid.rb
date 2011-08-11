class Grid
  attr_reader :grid
  
  def initialize(grid_size)
    @grid = []
    (1..grid_size).each do |i|
      row = []
      (1..grid_size).each do |i|
        row << BATTLESHIPS::CELL_MARKER
      end
      @grid << row 
    end
  end
  
  def print_grid
    puts
    grid.each do |row|
      row.each do |cell|
        print cell
      end
      puts
    end
    puts
  end
end
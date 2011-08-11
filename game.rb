require 'player'

class Game
  def initialize(ai = true, grid_size = 5)
    @player_one = HumanPlayer.new(grid_size)
    @player_two = ai ? ComputerPlayer.new(grid_size) : HumanPlayer.new(grid_size)
  end
  
  def start
    @player_one.place_boats
    @player_two.place_boats
    
    while @player_one.alive? && @player_two.alive? do
      @player_one.print_grid
      x,y = @player_one.get_coords
      @player_one.fire_upon(@player_two, x, y)
      
      @player_two.print_grid
      x,y = @player_two.get_coords
      @player_two.fire_upon(@player_one, x, y)
    end
    
    puts 'Game was a draw' if !@player_one.alive? && !@player_two.alive?
    puts 'Player One wins' if !@player_two.alive? && @player_one.alive?
    puts 'Player Two wins' if !@player_one.alive? && @player_two.alive?
  end
end
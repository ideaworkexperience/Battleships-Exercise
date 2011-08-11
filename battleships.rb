$:.unshift('.')

module BATTLESHIPS
  HIT_MARKER = '!'
  FIRE_MARKER = '$'
  CELL_MARKER = '#'
  SHIP_MARKER = '*'
  NUM_BOATS = 2
  FACE_COMPUTER_OPPONENT = true
  GRID_SIZE = 4
end

require 'game'

puts
puts '############################################'
puts '                 BATTLESHIPS                '
puts '############################################'
puts

#grid_size = 10
#against_computer = false

game = Game.new(BATTLESHIPS::FACE_COMPUTER_OPPONENT, BATTLESHIPS::GRID_SIZE)
game.start

puts
puts '############################################'
puts '                  GAME OVER                 '
puts '############################################'
puts


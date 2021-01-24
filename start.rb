# frozen_string_literal: false

require_relative 'board'


# The Knight class to demonstrate the piece moving around the board
class Knight
  attr_accessor :start, :end_pos, :forward, :direction

  def initialize(start_pos, end_pos)
    @start = start_pos
    @end_pos = end_pos
    # current position???
    @forward = 2
    @direction = 1
  end
end

puts 'This is Knights Travails please enter your start and end coordinates'
# I can add some validation here to ensure correct coordinates are
# added would use 2 gets commands one for the start and one for the end
# coordinates = gets.chomp

# horizontal first and then vertical with coordinates ---> ^
# knight = Knight.new([3, 7], [1, 7])
# shrimp = Knight.new([4, 5], [1, 2])
board = Board.new

# board.calculate_knight(knight)
# board.calculate_knight(shrimp)
# board.find_square([7, 6]).current_piece = 'Knight'

# puts board.find_square([3, 0]).current_piece
# puts board.find_square([1, 0]).end_square

a = board.find_square([3, 4])
#a.front = Square.new(nil)
#a.front.front = Square.new(nil)
p a #.front.front.left.position
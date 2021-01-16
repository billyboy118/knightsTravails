# frozen_string_literal: false

require_relative 'board'

# The Knight class to demonstrate the piece moving around the board
class Knight
  def initialize(start_pos, end_pos)
    @start = start_pos
    @end_pos = end_pos
    @forward = 2
    @direction = 1
  end
end

puts 'This is Knights Travails please enter your start and end coordinates'
# I can add some validation here to ensure correct coordinates are
# added would use 2 gets commands one for the start and one for the end
# coordinates = gets.chomp

# horizontal first and then vertical with coordinates ---> ^

# knight = Knight.new([0, 0] [1, 2])

board = Board.new
board.create_board
p board.board[1]

#p board.board[0].position

# frozen_string_literal: false



# squares to build up the board
class Square

  def initialize(place)
    @position = place
    @current_piece = nil

    @front = nil
    @back = nil
    @left = nil
    @right = nil
  end

end

# This class is used to create a board using the squares from th Square class
class Board

  def initialize
    @board = []
  end

  def create_board
    8.times do |v_num|
      8.times do |h_num|
        @board.push(Square.new([h_num, v_num]))
      end
    end
    link_squares
  end

  def link_squares
    corners = []

    @board.each do |value|

    end
  end

end
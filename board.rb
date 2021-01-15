# frozen_string_literal: false



# squares to build up the board
class Square

  def initialize
    @position = nil
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
    @board = create_board
  end

  def create_board

    square = Square.new()
  end

end
# frozen_string_literal: false



# squares to build up the board
class Square
  attr_accessor :position, :front, :back, :left, :right, :current_piece

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
  attr_accessor :board

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
    
    @board.each_with_index do |value, index|

      bottom(value, index) if value.position[1].zero?
      corners(value) if [[0, 0], [7, 0], [0, 7], [7, 7]].include?(value.position)
      
    end
  end

  def bottom(value, index)
    a = value.position
    a[1] = a[1] + 1
    p a 
    p index
  end

  def corners(value)
    case value.position
    when [0, 0]
      value.front = board[1]
      value.right = board[8]
    when [7, 0]
      value.front = board[1]
      value.right = board[8]
    when [0, 7]
      value.front = board[1]
      value.right = board[8]
    when [7, 7]
      value.front = board[1]
      value.right = board[8]
    end
  end


  

  def find_square(value)

  end

end

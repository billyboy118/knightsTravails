# frozen_string_literal: false

#require_relative 'start'

# squares to build up the board
class Square
  attr_accessor :position, :front, :back, :left, :right, :current_piece, :visited, :end_square

  def initialize(place)
    @position = place
    @current_piece = nil
    @visited = false
    @end_square = false

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
      bottom(value, index) if value.position[1].zero? && ![0, 7].include?(index)
      left(value, index) if value.position[0].zero? && ![0, 7].include?(index)
      top(value, index) if value.position[1] == 7 && ![0, 7].include?(index)
      right(value, index) if value.position[0] == 7 && ![0, 7].include?(index)
      corners(value) if [[0, 0], [7, 0], [0, 7], [7, 7]].include?(value.position)
      body(value, index) if value.position[0].positive? && value.position[0] < 7
    end
  end

  def bottom(value, index)
    value.front = board[index + 8]
    value.left = board[index - 1]
    value.right = board[index + 1]
    value
  end

  def left(value, index)
    value.front = board[index + 8]
    value.back = board[index - 8]
    value.right = board[index + 1]
    value
  end

  def top(value, index)
    value.back = board[index - 8]
    value.left = board[index - 1]
    value.right = board[index + 1]
  end

  def right(value, index)
    value.front = board[index + 8]
    value.back = board[index - 8]
    value.left = board[index - 1]
    value
  end

  def corners(value)
    case value.position
    when [0, 0]
      value.front = board[8]
      value.right = board[1]
    when [7, 0]
      value.front = board[15]
      value.left = board[6]
    when [0, 7]
      value.back = board[48]
      value.right = board[57]
    when [7, 7]
      value.back = board[55]
      value.left = board[62]
    end
    value
  end

  def body(value, index)
    value.front = board[index + 8]
    value.back = board[index - 8]
    value.left = board[index - 1]
    value.right = board[index + 1]
    value
  end

  def find_square(value)
    board.each do |square|
      return square if square.position == value
    end
  end

  def calculate_knight(knight)
    start = find_square(knight.start)
    start.current_piece = knight
    find_square(knight.end_pos).end_square = true
    paths(start, knight)
  end

  def paths(start, knight)
    queue = [start]
    while queue.length < 0




    end


  end

end

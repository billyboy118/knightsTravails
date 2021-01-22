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
    value.back = Square.new(nil)
    value.back.back = Square.new(nil)
    value.left = board[index - 1]
    value.right = board[index + 1]
    value
  end

  def left(value, index)
    value.front = board[index + 8]
    value.back = board[index - 8]
    value.left = Square.new(nil)
    value.left.left = Square.new(nil)
    value.right = board[index + 1]
    value
  end

  def top(value, index)
    value.front = Square.new(nil)
    value.front.front = Square.new(nil)
    value.back = board[index - 8]
    value.left = board[index - 1]
    value.right = board[index + 1]
    value
  end

  def right(value, index)
    value.front = board[index + 8]
    value.back = board[index - 8]
    value.left = board[index - 1]
    value.right = Square.new(nil)
    value.right.right = Square.new(nil)
    value
  end

  def corners(value)
    case value.position
    when [0, 0]
      value.front = board[8]
      value.back = Square.new(nil)
      value.back.back = Square.new(nil)
      value.left = Square.new(nil)
      value.left.left = Square.new(nil)
      value.right = board[1]
    when [7, 0]
      value.front = board[15]
      value.back = Square.new(nil)
      value.back.back = Square.new(nil)
      value.left = board[6]
      value.right = Square.new(nil)
      value.right.right = Square.new(nil)
    when [0, 7]
      value.front = Square.new(nil)
      value.front.front = Square.new(nil)
      value.back = board[48]
      value.left = Square.new(nil)
      value.left.left = Square.new(nil)
      value.right = board[57]
    when [7, 7]
      value.front = Square.new(nil)
      value.front.front = Square.new(nil)
      value.back = board[55]
      value.left = board[62]
      value.right = Square.new(nil)
      value.right.right = Square.new(nil)
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
    while queue.length.positive?
      node = queue.pop
      queue.unshift(find_nodes(node)).flatten
      return
    end
  end

  def find_nodes(node)
    temp_arr = []
    temp_arr.push(front_left(node))
    temp_arr.push(front_right(node))
    temp_arr.push(back_left(node))
    temp_arr.push(back_right(node))
    temp_arr.push(left_front(node))
    temp_arr.push(left_back(node))
    temp_arr.push(right_front(node))
    temp_arr.push(right_back(node))
    temp_arr
  end

  def front_left(node)
   #if node.front.front.left.nil? && node.front.front.right 
  end

  def front_right(node)
    #if node.front.front.left.nil? && node.front.front.right 
  end

  def back_left(node)

  end

  def back_right(node)

  end

  def left_front(node)
    return puts 'it  works' if node.left.left.front.nil? || node.left.left.front.position.nil?
  end

  def left_back(node)
    return puts 'it  works' if node.left.left.front.nil? || node.left.left.front.position.nil?
  end

  def right_front(node)

  end

  def right_back(node)

  end



end

# frozen_string_literal: false

require_relative 'modules'

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
  include MakeBoard
  attr_accessor :board

  def initialize
    @board = []
    create_board(board)
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
    order = []
      while queue.length.positive?
      node = queue.pop
      
      order.push(node.position)
      p order

      queue.unshift(find_nodes(node)).flatten!
      puts queue[1]
    end
  end

  def find_nodes(node)
    temp_arr = []
    temp_arr.push(front_left(node))
    #temp_arr.push(front_right(node))
    # temp_arr.push(back_left(node))
    # temp_arr.push(back_right(node))
    # temp_arr.push(left_front(node))
    # temp_arr.push(left_back(node))
    # temp_arr.push(right_front(node))
    # temp_arr.push(right_back(node))
    #puts temp_arr[1]
    temp_arr
  end

  def front_left(node)
    node = node.front.front.left
    puts node.front.position
    if node.nil? || node.position.nil?
      puts 'aaaaaa'
      nil
    elsif node.end_square == true
      puts 'you made it'
      node
    else
      puts 'ffffff'
      node
    end
  end

  def front_right(node)
    if node.front.front.right.nil? || node.front.front.right.position.nil?
     # node = nil
      puts 'aaaaaa'
    elsif node.front.front.right.end_square == true
      puts 'you made it'
      return
    else
      node = node.front.front.right
      puts 'ffffff'
    end
    #puts node
    node
  end

  def back_left(node)

  end

  def back_right(node)

  end

  def left_front(node)
    #return puts 'it  works' if node.left.left.front.nil? || node.left.left.front.position.nil?
  end

  def left_back(node)
    #return puts 'it  works' if node.left.left.front.nil? || node.left.left.front.position.nil?
  end

  def right_front(node)

  end

  def right_back(node)

  end



end

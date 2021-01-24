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
    @counter = 0
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
    i = 0
    while queue.length.positive?
      node = queue.pop
      next if node.nil? || node.position.nil?
      i += 1
      order.push(node.position)
    
      
      return puts "you have found it number #{i}" if node.end_square == true
      
      queue.unshift(find_nodes(node)).flatten!
     
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
    count_nodes(temp_arr)
    
    temp_arr.reverse!
  end

  def count_nodes(array)
    arr = []
    array.each do |item|
      next if item.nil?

      arr.push(item.position) unless item.position.nil?
    end
    @counter += 1
    p arr
  end



  def front_left(node)
    #puts node.position
    node = node.front.front.left
    if node.nil? || node.position.nil?
      nil
    elsif node.end_square == true
      puts "you have found it in #{@counter} go"
      node
    else
      node
    end
  end

  def front_right(node)
    node = node.front.front.right
    if node.nil? || node.position.nil?
      nil
    elsif node.end_square == true
      puts "you have found it in #{@counter} go"
      node
    else
      node
    end
    node
  end

  def back_left(node)
    node = node.back.back.left
    if node.nil? || node.position.nil?
      nil
    elsif node.end_square == true
      puts "you have found it in #{@counter} go"
      node
    else
      node
    end
    node
  end

  def back_right(node)
    node = node.back.back.right
    if node.nil? || node.position.nil?
      nil
    elsif node.end_square == true
      puts "you have found it in #{@counter} go"
      node
    else
      node
    end
    node
  end

  def left_front(node)
    node = node.left.left.front
    if node.nil? || node.position.nil?
      nil
    elsif node.end_square == true
      puts "you have found it in #{@counter} go"
      node
    else
      node
    end
    node
  end

  def left_back(node)
    node = node.left.left.back
    if node.nil? || node.position.nil?
      nil
    elsif node.end_square == true
      puts "you have found it in #{@counter} go"
      node
    else
      node
    end
    node
  end

  def right_front(node)
    node = node.right.right.front
    if node.nil? || node.position.nil?
      nil
    elsif node.end_square == true
      puts "you have found it in #{@counter} go"
      node
    else
      node
    end
    node
  end

  def right_back(node)
    node = node.right.right.back
    if node.nil? || node.position.nil?
      nil
    elsif node.end_square == true
      puts "you have found it in #{@counter} go"
      node
    else
      node
    end
    node
  end



end

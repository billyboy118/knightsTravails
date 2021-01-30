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
    @counter = []
    @cycle = 1
    create_board(board)
  end

  def find_square(value)
    board.each do |square|
      return square if square.position == value
    end
  end

  def calculate_knight(start, finish)
    @@finish = finish
    start = find_square(start)
    find_square(finish).end_square = true

    start.current_piece = Knight.new
    start.current_piece.squares_visited = start.position
    puts start.current_piece.squares_visited
    paths(start)
  end

  def paths(start)
    queue = [start]
    order = []

    while queue.length.positive?
      node = queue.pop
      next if node.nil? || node.position.nil?


      if node.end_square == true
        node.current_piece.squares_visited.push(node.position)
        return p node.current_piece.squares_visited
      end
      order.push(node.position)



      queue.unshift(find_nodes(node)).flatten!

      


    end
  end

  def find_nodes(node)
    temp_arr = []
    temp_arr.push(front_left(node))
    temp_arr.push(front_right(node))
    # temp_arr.push(back_left(node))
    # temp_arr.push(back_right(node))
    # temp_arr.push(left_front(node))
    # temp_arr.push(left_back(node))
    # temp_arr.push(right_front(node))
    # temp_arr.push(right_back(node))
    temp_arr.reverse!
  end

  def journey(node, new_node)
    knight = Knight.new
    new_node.current_piece = knight
    knight.squares_visited.push(node.current_piece.squares_visited)
    knight.squares_visited.push(node.position)
  end

  def front_left(node)
    new_node = node.front.front.left
    if new_node.nil? || new_node.position.nil?
      nil
    elsif new_node.end_square == true
      journey(node, new_node)
      new_node
    else
      journey(node, new_node)
      new_node
    end
  end

  def front_right(node)
    new_node = node.front.front.right
    if new_node.nil? || new_node.position.nil?
      nil
    elsif new_node.end_square == true
      journey(node, new_node)
      new_node
    else
      journey(node, new_node)
      new_node
    end
  end

  # def back_left(node)
  #   node = node.back.back.left
  #   if node.nil? || node.position.nil?
  #     nil
  #   elsif node.end_square == true
  #     node
  #   else
  #     node
  #   end
  #   node
  # end

  # def back_right(node)
  #   node = node.back.back.right
  #   if node.nil? || node.position.nil?
  #     nil
  #   elsif node.end_square == true
  #     node
  #   else
  #     node
  #   end
  #   node
  # end

  # def left_front(node)
  #   node = node.left.left.front
  #   if node.nil? || node.position.nil?
  #     nil
  #   elsif node.end_square == true
  #     node
  #   else
  #     node
  #   end
  #   node
  # end

  # def left_back(node)
  #   node = node.left.left.back
  #   if node.nil? || node.position.nil?
  #     nil
  #   elsif node.end_square == true
  #     node
  #   else
  #     node
  #   end
  #   node
  # end

  # def right_front(node)
  #   node = node.right.right.front
  #   if node.nil? || node.position.nil?
  #     nil
  #   elsif node.end_square == true
  #     node
  #   else
  #     node
  #   end
  #   node
  # end

  # def right_back(node)
  #   node = node.right.right.back
  #   if node.nil? || node.position.nil?
  #     nil
  #   elsif node.end_square == true
  #     node
  #   else
  #     node
  #   end
  #   node
  # end
end

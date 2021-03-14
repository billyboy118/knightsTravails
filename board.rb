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

    # @front = nil
    # @back = nil
    # @left = nil
    # @right = nil
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

  def create_board(board)
    (0..7).each do |vertical|
      (0..7).each do |horizontal|
        board.push(Square.new([horizontal, vertical]))
      end
    end
  end

  def calculate_knight(start, finish)
    start = find_square(start)
    find_square(finish).end_square = true

    start.current_piece = Knight.new

    puts start.current_piece.squares_visited
    paths(start)
  end

  def find_square(value)
    board.each do |square|
      return square if square.position == value
    end
  end

  def paths(start)
    queue = [start]
    # order = []
    while queue.length.positive?
      node = queue.pop
      puts node
      return return_value(node) if node.end_square == true

      queue.unshift(find_positions(node)).flatten!
      # order.push(node.position)
    end
  end   





  # def paths(start)
  #   queue = [start]
  #   order = []
  #   while queue.length.positive?
  #     node = queue.pop
  #     next if node.nil? || node.position.nil?

  #     return return_value(node) if node.end_square == true

  #     order.push(node.position)
  #     queue.unshift(find_nodes(node)).flatten!
  #   end
  # end


  def return_value(node)
    node.current_piece.squares_visited.push(node.position)
    puts "You made it in #{node.current_piece.squares_visited.length - 1} moves! Here's your path:"
    node.current_piece.squares_visited.each_with_index do |place, index|
      if index.zero?
        puts "Start: #{place}"
      else
        puts "  #{index}:   #{place}"
      end
    end
  end

  def find_positions(node)
    temp_arr = []
    knight_moves = [[-1, 2], [1, 2], [2, 1], [2, -1], [-1, -2], [1, -2], [-2, 1], [-2, -1]]
    knight_moves.each do |move|
      temp_arr.push([node.position[0] + move[0], node.position[1] + move[1]])
    end
    available_moves = clean_data(temp_arr)
    analyse_moves(available_moves, node)
  end

  def clean_data(array)
    moves = []
    array.each do |item|
      moves.push(item) if (item[0] >= 0 && item[0] < 8) && (item[1] >= 0 && item[1] < 8)
    end
    assign_moves(moves)
  end

  def assign_moves(moves)
    assigned_moves = []
    moves.each do |move|
      assigned_moves.push(find_square(move))
    end
    assigned_moves
  end

  def analyse_moves(available_moves, node)
    # I need to link the available moves to the square
    available_moves.each do |move|
      journey(node, move)
    end
  end
  # def find_node(node) # rubocop:disable Metrics/AbcSize
  #   temp_arr = []

  #   nodes = [node.front.front.left, node.front.front.right, node.back.back.left, node.back.back.right,
  #            node.left.left.front, node.left.left.back, node.right.right.front, node.right.right.back]
  #   nodes.each do |new_node|
  #     temp_arr.push(splint(node, new_node))
  #   end
  #   temp_arr.reverse!
  # end

  # def splint(node, new_node)
  #   if new_node.nil? || new_node.position.nil?
  #     nil
  #   elsif new_node.end_square == true
  #     journey(node, new_node)
  #     new_node
  #   else
  #     journey(node, new_node)
  #     new_node
  #   end
  # end

  def journey(node, new_node)
    knight = Knight.new
    new_node.current_piece = knight
    node.current_piece.squares_visited.each do |location|
      knight.squares_visited.push(location)
    end
    knight.squares_visited.push(node.position)
  end
end

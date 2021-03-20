# frozen_string_literal: false

# squares to build up the board
class Square
  attr_accessor :position, :current_piece, :end_square

  def initialize(place)
    @position = place
    @current_piece = ' '
    @end_square = false
  end
end

# This class is used to create a board using the squares from the Square class
class Board
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
    while queue.length.positive?
      node = queue.pop

      return return_value(node) if node.end_square == true

      queue.unshift(find_positions(node)).flatten!
    end
  end

  def return_value(node)
    node.current_piece.squares_visited.push(node.position)
    puts "You made it in #{node.current_piece.squares_visited.length - 1} moves! Here's your path:"
    show_path(node)
    ShowBoard.show_board(Board.new, node.current_piece.squares_visited)
  end

  def show_path(node)
    letters = { 0 => 'A', 1 => 'B', 2 => 'C', 3 => 'D', 4 => 'E', 5 => 'F', 6 => 'G', 7 => 'H' }
    node.current_piece.squares_visited.each_with_index do |place, index|
      if index.zero?
        puts "Start: #{letters[place[0]]}, #{place[1] + 1} "
      else
        puts "  #{index}: #{letters[place[0]]}, #{place[1] + 1}"
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
    available_moves.each do |move|
      journey(node, move)
    end
  end

  def journey(node, new_node)
    knight = Knight.new
    new_node.current_piece = knight
    node.current_piece.squares_visited.each do |location|
      knight.squares_visited.push(location)
    end
    knight.squares_visited.push(node.position)
  end
end

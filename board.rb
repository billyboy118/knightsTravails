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
    start = find_square(start)
    find_square(finish).end_square = true
    paths(start)
  end

  def paths(start)
    queue = [start]
    order = []
    i = 0
    while queue.length.positive?
      node = queue.pop
      next if node.nil? || node.position.nil?

      i += 1
      p i
      p @cycle
      return puts "you have found it number #{@cycle}" if node.end_square == true

      order.push(node.position)
      if i == @counter[@cycle - 1]
        @cycle += 1
        i = 0
        
      end 
      # I am giving up on the layered apprroach what I will do  now is create multipe knights at 
      # node points, from here I will be able to store where each individual knight has been

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
    i = 0
    arr = []
    array.each do |item|
      next if item.nil?

      i += 1 unless item.position.nil?
      arr.push(item.position) unless item.position.nil?
    end
    @counter.push(i)
   p @counter
   # p i
    #p arr
  end



  def front_left(node)
    #puts node.position
    node = node.front.front.left
    if node.nil? || node.position.nil?
      nil
    elsif node.end_square == true
      #puts "you have found it in #{@cycle} go"
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
      #puts "you have found it in #{@cycle} go"
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
      #puts "you have found it in #{@cycle} go"
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
      #puts "you have found it in #{@cycle} go"
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
      #puts "you have found it in #{@cycle} go"
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
      #puts "you have found it in #{@cycle} go"
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
     # puts "you have found it in #{@cycle} go"
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
      #puts "you have found it in #{@cycle} go"
      node
    else
      node
    end
    node
  end



end

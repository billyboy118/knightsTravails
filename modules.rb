# frozen_string_literal: false

# module to make the board for board class
module MakeBoard # rubocop:disable Metrics/ModuleLength
  def create_board(board)
    8.times do |v_num|
      8.times do |h_num|
        board.push(Square.new([h_num, v_num]))
      end
    end
    link_squares
  end

  def link_squares # rubocop:disable Metrics/AbcSize
    board.each_with_index do |value, index|
      body(value, index)
      bottom(value, index) if value.position[1].zero?
      left(value, index) if value.position[0].zero?
      top(value, index) if value.position[1] == 7
      right(value, index) if value.position[0] == 7
      corners(value) if [[0, 0], [7, 0], [0, 7], [7, 7]].include?(value.position)
    end
  end

  def fronts(value, index)
    value.front = board[index + 8]
  end

  def backs(value, index)
    value.front = board[index + 8]
  end

  def lefts(value, index)
    value.front = board[index + 8]
  end

  def rights(value, index)
    value.front = board[index + 8]
  end

  def bottom(value, index)
    fronts(value, index)
    value.back = Square.new(nil)
    value.back.back = Square.new(nil)
    lefts(value, index)
    rights(value, index)
    value
  end

  def left(value, index)
    fronts(value, index)
    backs(value, index)
    value.left = Square.new(nil)
    value.left.left = Square.new(nil)
    rights(value, index)
    value
  end

  def top(value, index)
    backs(value, index)
    lefts(value, index)
    rights(value, index)
    value.front = Square.new(nil)
    value.front.front = Square.new(nil)
  end

  def right(value, index)
    fronts(value, index)
    backs(value, index)
    lefts(value, index)
    value.right = Square.new(nil)
    value.right.right = Square.new(nil)
    value
  end

  def corners(value) # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
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
end

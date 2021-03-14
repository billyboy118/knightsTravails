# frozen_string_literal: false

# module to visually display the board
module ShowBoard
  def show_board(board, places)
    add_pieces(board, places)

    print '7'
    (56..63).each do |i|
      print "|#{board.board[i].current_piece}"
    end
    print "|"
    puts ""
    print '6'
    (48..55).each do |i|
      print "|#{board.board[i].current_piece}"
    end
    print "|"
    puts ""
    print '5'
    (40..47).each do |i|
      print "|#{board.board[i].current_piece}"
    end
    print "|"
    puts ""
    print '4'
    (32..39).each do |i|
      print "|#{board.board[i].current_piece}"
    end
    print "|"
    puts ""
    print '3'
    (24..31).each do |i|
      print "|#{board.board[i].current_piece}"
    end
    print "|"
    puts ""
    print '2'
    (16..23).each do |i|
      print "|#{board.board[i].current_piece}"
    end
    print "|"
    puts ""
    print '1'
    (8..15).each do |i|
      print "|#{board.board[i].current_piece}"
    end
    print "|"
    puts ""
    print '0'
    (0..7).each do |i|
      print "|#{board.board[i].current_piece}"
    end
    print "|"
    puts ""
    print '  0 1 2 3 4 5 6 7'
    puts ""
  end

  def add_pieces(board, places)
    places.each do |place|
      board.board.each do |square|
        if place == square.position
          square.current_piece = "\u265E"
        end
      end
    end
  end
end

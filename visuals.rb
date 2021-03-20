# frozen_string_literal: false

# module to visually display the board
module ShowBoard
  def self.show_board(board, places)
    add_pieces(board, places)
    puts ''
    print '   8'
    (56..63).each do |i|
      print "|#{board.board[i].current_piece}"
    end
    print '|'
    puts ''
    print '   7'
    (48..55).each do |i|
      print "|#{board.board[i].current_piece}"
    end
    print '|'
    puts ''
    print '   6'
    (40..47).each do |i|
      print "|#{board.board[i].current_piece}"
    end
    print '|'
    puts ''
    print '   5'
    (32..39).each do |i|
      print "|#{board.board[i].current_piece}"
    end
    print '|'
    puts ''
    print '   4'
    (24..31).each do |i|
      print "|#{board.board[i].current_piece}"
    end
    print '|'
    puts ''
    print '   3'
    (16..23).each do |i|
      print "|#{board.board[i].current_piece}"
    end
    print '|'
    puts ''
    print '   2'
    (8..15).each do |i|
      print "|#{board.board[i].current_piece}"
    end
    print '|'
    puts ''
    print '   1'
    (0..7).each do |i|
      print "|#{board.board[i].current_piece}"
    end
    print '|'
    puts ''
    print '     A B C D E F G H'
    puts ''
    puts ''
  end

  def self.add_pieces(board, places)
    places.each_with_index do |place, index|
      board.board.each do |square|
        if place == square.position && index == 0
          square.current_piece = "\u265E"
        elsif place == square.position
          square.current_piece = index
        end
      end
    end
  end
end

# frozen_string_literal: false

require_relative 'visuals'
require_relative 'board'
require 'colorize'


def clear
  print "\e[2J\e[f"
end

# The Knight class to demonstrate the piece moving around the board
class Knight
  attr_accessor :squares_visited

  def initialize
    @squares_visited = []
  end
end
clear

module StartGame
  def self.start_game
    start_message
    start = position('start')
    finish = position('finish')
    board = Board.new
    board.calculate_knight(start, finish)
  end

  def self.start_message
    print 'This is Knights Travails, the aim of this is to be able to show the shortest route the knight can travelfrom A'.yellow
    puts ' to B on a standard chess board.'.yellow
    ShowBoard.show_board(Board.new, places)
    puts "When inputting please use 1 to 8 and A-H, it does not matter how you input this. \n"
  end

  def self.position(string='go')
    print "Where would you like to #{string}?: ".red
    convert(gets.chomp)
  end

  def self.places
    temp_arr = []
    64.times do
      temp_arr << [' ']
    end
    temp_arr
  end

  def self.convert(str)
    str = str.split
    str_length = str.length
    if str_length == 2 && str[0].length == 1 && str[1].length == 1
      validate_input(str)
    elsif str_length == 1 && str[0].length == 2
      validate_input(str)
    else
      puts 'You have input the wrong amount of characters, please only input 2'
      position
    end
  end

  def self.validate_input(str)
    str = str.join('').downcase
    if /[1-8][a-h]|[a-h][1-8]/.match(str)
      assign_value(str.split(''))
    else
      puts 'You have input the incorrect characters, please only input A-H and 1-8'
      position
    end
  end

  def self.assign_value(arr)
    /[1-8]/.match(arr[0]) ? arr.reverse! : arr
    puts arr
    numbers = { 'a' => 0, 'b' => 1, 'c' => 2, 'd' => 3, 'e' => 4, 'f' => 5, 'g' => 6, 'h' => 7 }
    arr[0] = numbers[arr[0]]
    arr[1] = arr[1].to_i - 1
    arr
  end
end

StartGame.start_game

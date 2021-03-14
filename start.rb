# frozen_string_literal: false

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

def start_game
  puts 'This is Knights Travails, it uses 0-7 to represent a 8x8 chess grid and will the shortest route the knight can go from A to B '.yellow
  print 'Where would you like to start [?, ?]: '.red
  start = convert(gets.chomp)
  p start
  print 'Where would you like to finish [?, ?]: '.red
  finish = convert(gets.chomp)
  p finish
  board = Board.new
  board.calculate_knight(start, finish)
end

def convert(str)
  arr = []
  str.split(/\W+/).each { |number| arr.push(number.to_i) }
  arr
end

start_game

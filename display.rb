require_relative 'cursor'
require_relative 'board'
require 'colorized'
class Display

  attr_reader :cursor, :board
  PIECE_HASH = {
    r: '♜',
    p: '♟',
    kn: '♞',
    b: '♝',
    k: '♚',
    q: '♛',
    null: ' '
  }
  CURSOR_ICO = ["👆🏼","👇🏻"]

  def initialize(board = Board.new, cursor = Cursor.new([0,0], board))
    @board = board
    @cursor = cursor
  end

  def render
    @board.grid.length.times do |x|
      print " "
      @board.grid[0].length.times do |y|
        if [x,y] == @cursor.cursor_pos
          if cursor.selected
            print "#{CURSOR_ICO[1]} "
          else
            print "#{CURSOR_ICO[0]} "
          end
        else
          piece = @board[[x,y]]
          print "#{PIECE_HASH[piece.symbol].colorize(piece.color)} "
        end
      end
      print "\n"
    end
  end
end

# display = Display.new
# system("clear")
# until 2 < 1
#   display.render
#   display.cursor.get_input
#   system("clear")
# end
#
# display.board

d = Display.new
q = d.board.grid[0][0]

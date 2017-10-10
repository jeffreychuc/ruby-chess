require_relative 'cursor'
require_relative 'board'
class Display
  PIECE_HASH = {
    r: '♜',
    p: '♟',
    kn: '♞',
    b: '♝',
    k: '♚',
    q: '♛',
  }

  def initialize(board = Board.new, cursor = Cursor.new([0,0], board))
    @board = board
    @cursor = cursor
  end

  def render
    @board.grid.length.times do |x|
      print " "
      @board.grid[0].length.times do |y|
        print "#{PIECE_HASH[@board[[x,y]].type]} "
      end
      print "\n"
    end
  end
end

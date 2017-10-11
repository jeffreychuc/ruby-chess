require_relative 'movement_modules'
require 'singleton'
class Piece
  attr_reader :color, :symbol, :board

  def initialize(color, symbol, board, pos)
    # color is stored as a symbol
    # :b, :w
    @color = color
    # type is also a symbol
    # r:
    # p:
    # kn:
    # b:
    # k:
    # q:
    @symbol = symbol
    @board = board
    @pos = pos
  end

end

class NullPiece < Piece
  include Singleton

  def initialize
    @color = nil
    @symbol = :null
    @board = nil
    @pos = nil

  end
end

class KingPiece < Piece
  include Stepable
  def move_dirs
    diagonal_dirs + horizontal_dirs
  end
end

class KnightPiece < Piece
  include Stepable
  def move_dirs
    knight_dirs
  end
end

class BishopPiece < Piece
  include Slideable
  def move_dirs
    diagonal_dirs
  end
end

class RookPiece < Piece
  include Slideable
  def move_dirs
    horizontal_dirs
  end
end

class QueenPiece < Piece
  include Slideable
  def move_dirs
    diagonal_dirs + horizontal_dirs
  end
end

class PawnPiece < Piece
  def moves
    side_attacks
  end

  protected
  def at_start_row?
    #depends on color
    curr_row = @pos[1]
    # color and actual start row
    if @color == :white && curr_row == 1
      return true
    elsif @color == :black && curr_row == 6
      return true
    end
    false
  end

  def forward_direction
    return [0, 1] if @color == :white
    [0, -1]
  end

  def forward_steps
    return 2 if at_start_row?
    1
  end

  def side_attacks

  end
end

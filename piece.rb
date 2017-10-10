require_relative 'movement_modules'

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
  def initialize(color = nil, symbol = :null, board)
    @color = color
    @symbol = symbol
    @board = board
    super(color, symbol, board)
  end
end

class KingPiece < Piece
  include Stepable
end

class KnightPiece < Piece
  include Stepable
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
end

class PawnPiece < Piece
end

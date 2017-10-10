class Piece
  attr_reader :color, :type

  def initialize(color, type)
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
    @type = type
  end

end

class NullPiece < Piece

end

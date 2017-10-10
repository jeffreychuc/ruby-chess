require_relative 'piece'
require 'colorize'
class Board
  PIECE_POS =
  {
    black:   {
      r:  [[0, 0], [0, 7]],
      p:  [[1, 0], [1, 1], [1, 2], [1, 3], [1, 4], [1, 5], [1, 6], [1, 7]],
      kn: [[0, 1], [0, 6]],
      b:  [[0, 2], [0, 5]],
      k:  [[0, 3]],
      q:  [[0, 4]]
    },

    white:  {
      r:  [[7, 0], [7, 7]],
      p:  [[6, 0], [6, 1], [6, 2], [6, 3], [6, 4], [6, 5], [6, 6], [6, 7]],
      kn: [[7, 1], [7, 6]],
      b:  [[7, 2], [7, 5]],
      k:  [[7, 4]],
      q:  [[7, 3]]
    }
  }

  # attr_accessor :grid
    attr_reader :grid

  def initialize(grid = Array.new(8){ Array.new(8) })
    @grid = grid
    make_starting_grid
  end

  def move_piece(from_pos, to_pos) # color [color is stored as instance var in piece class]
    raise "Invalid move, piece does not exist" if @grid[from_pos].is_a?(NullPiece)
    curr_piece = self[from_pos]
    raise "Invalid move" if !curr_piece.valid_moves.include?([from_pos, to_pos])
    move_piece!(from_pos, to_pos)
  end

  def move_piece!(from_pos, to_pos)
    self[from_pos], self[to_pos] = self[to_pos], self[from_pos]
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @grid[row][col] = value
  end

  protected
  def make_starting_grid
    init_piece_placement
    fill_null_piece
  end

  def init_piece_placement
    PIECE_POS.keys.each do |color|
      PIECE_POS[color].keys.each do |type|

        curr_type_positions = PIECE_POS[color][type]

        curr_type_positions.each do |pos|
          self[pos] = Piece.new(color, type)
        end

      end
    end
  end

  def fill_null_piece
    null_piece = NullPiece.new(color = nil, type = :null)
    @grid.each_with_index do |row, i|
      row.each_with_index do |pos, j|
        if self[[i,j]] == nil
          self[[i,j]] = null_piece
        end
      end
    end
  end
end

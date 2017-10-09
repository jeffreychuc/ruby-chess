class Board

  def initialize(grid = Array.new(8){ Array.new(8) })
    @grid = grid
    make_starting_grid
  end

  def move_piece(color, from_pos, to_pos)
  end

  def move_piece!(from_pos, to_pos)
  end

  protected
  STARTING_POSITIONS =
  {
    b:   {
      r:  [[0, 0], [0, 7]],
      p:  [[1, 0], [1, 1], [1, 2], [1, 3], [1, 4], [1, 5], [1, 6], [1, 7]],
      kn: [[0, 1], [0, 6]],
      b:  [[0, 2], [0, 5]],
      k:  [[0, 3]],
      q:  [[0, 4]]
    },

    w:  {
      r:  [[7, 0], [7, 7]],
      p:  [[6, 0], [6, 1], [6, 2], [6, 3], [6, 4], [6, 5], [6, 6], [6, 7]],
      kn: [[7, 1], [7, 6]],
      b:  [[7, 2], [7, 5]],
      k:  [[7, 4]],
      q:  [[7, 3]]
    }
  }
  def make_starting_grid
  end
end

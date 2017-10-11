module Slideable
  def moves
    grow_unblocked_moves_in_dir(@pos)
  end

  private

  def diagonal_dirs
    [[-1, 1],
    [-1, -1],
    [1, -1],
    [1, 1]]
  end

  def horizontal_dirs
    [[1, 0],
     [0, 1],
     [-1, 0],
     [0, -1]]
  end

  def grow_unblocked_moves_in_dir(pos)
    fin_moves = []
    move_dirs.each do |delta|
      potential = pos.dup
      while board_bounds?(potential)
        potential[0] += delta[0]
        potential[1] += delta[1]
        board_check_piece = @board.grid[potential[0]][potential[1]]
        if !board_check_piece.is_a?(NullPiece)
          # if opposite color piece
          if board_check_piece.color != self.color
            # add move, but break
            fin_moves.push(potential.dup)
          end
          break
        end
        fin_moves.push(potential.dup) if board_bounds?(potential)
      end
    end
    fin_moves.dup
  end

  def board_bounds?(potential)
    y_axis_range = @board.grid.length - 1
    x_axis_range = @board.grid[0].length - 1

    potential[0].between?(0, y_axis_range) && potential[1].between?(0, x_axis_range)
  end
end

module Stepable

  def moves
    move_diffs
  end

  private

  def diagonal_dirs
    [[-1, 1],
    [-1, -1],
    [1, -1],
    [1, 1]]
  end

  def horizontal_dirs
    [[1, 0],
     [0, 1],
     [-1, 0],
     [0, -1]]
  end

  def knight_dirs
    [[1, 2],
     [2, 1],
     [-1, 2],
     [-2, 1],
     [-1, -2],
     [-2, -1]]
  end


  def move_diffs
    directions = move_dirs
    output = []
    directions.each do |delta|
      temp = [@pos[0] + delta[0], @pos[1] + delta[1]]
      if board_bounds?(temp)
        if !@board.grid[temp].is_a?(NullPiece)
          next if @board.grid[temp].color == self.color
        end
        output.push(temp)
      end
    end
    output
  end

  def board_bounds?(potential)
    y_axis_range = @board.grid.length - 1
    x_axis_range = @board.grid[0].length - 1

    potential[0].between?(0, y_axis_range) && potential[1].between?(0, x_axis_range)
  end

end

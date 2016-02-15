class Piece

  attr_reader :pos, :board

  def initialize(pos, board)
    @pos = pos
    @board = board
  end

  def move(pos)
    @pos = pos
  end

  def moves
    raise "error"
  end

  def to_s
    value
  end

end

class SlidingPiece < Piece

  def move_dirs
    raise "errorrr"
  end

  def moves
    move_dirs.map { |dir| find_moves_in_direction(dir) }.flatten
  end

  def find_moves_in_direction(dir)
    result = []
    return [] unless @board[dir[0]].nil?
    result << dir[0]
    result += find_moves_in_direction(dir.drop(1))
  end

  def get_horizontals
    horizontal_left = []
    (0...pos[1]).each { |i| horizontal_left << [pos[0], i] }
    horizontal_right = []
    (pos[1]...8).each { |i| horizontal_right << [pos[0], i] }
    vertical_top = []
    (0...pos[0]).each { |i| vertical_top << [i, pos[1]] }
    vertical_bottom = []
    (pos[0]...8).each { |i| vertical_bottom << [i, pos[1]] }
    [horizontal_left, horizontal_right, vertical_top, vertical_bottom]
  end

  def get_top_diagonals
    diagonal_top_left = []
    i = 0
    until pos[0] - i < 0 || pos[1] - i < 0
      diagonal_top_left << [pos[0] - i, pos[1] - i]
      i += 1
    end
    diagonal_top_right = []
    i = 0
    until pos[0] - i < 0 || pos[1] + i > 8
      diagonal_top_right << [pos[0] - i, pos[1] + i]
      i += 1
    end
    [diagonal_top_left, diagonal_top_right]
  end

  def get_bottom_diagonals
    diagonal_bottom_left = []
    until pos[0] + i > 8 || pos[1] - i < 0
      diagonal_bottom_left  << [pos[0] + i, pos[1] - i]
      i += 1
    end
    diagonal_bottom_right = []
    i = 0
    until pos[0] + i > 8 || pos[1] + i > 8
      diagonal_bottom_right << [pos[0] + i, pos[1] + i]
      i += 1
    end
    [diagonal_bottom_left, diagonal_bottom_right]
  end

end


class SteppingPiece < Piece

end

class Rook < SlidingPiece

  def initialize
  end

  def move_dirs
    get_horizontals
  end
end


class Bishop < SlidingPiece

  def move_dirs
    get_top_diagonals + get_bottom_diagonals
  end

end

class Queen < SlidingPiece

    def move_dirs
      get_horizontals + get_top_diagonals + get_bottom_diagonals
    end

end

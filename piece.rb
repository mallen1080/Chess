require 'byebug'

class Piece

  attr_reader :pos, :board, :color

  def initialize(pos, board, color)
    @pos, @board, @color = pos, board, color
    @value = "P"
  end

  def move(pos)
    @pos = pos
  end

  def moves
    raise "error"
  end

  def to_s
    @value
  end

end

class SlidingPiece < Piece


  def move_dirs
    raise "errorrr"
  end

  def moves
    final = []

    move_dirs.each do |dir|
      valid = find_moves_in_direction(dir)
      valid.each do |space|
        final << space
      end
    end
    final
  end

  def find_moves_in_direction(dir)
    result = []
    return dir if dir.empty?
    if @board[dir[0]]
      return (@board[dir[0]].color == color ? [] : [dir[0]])
    else
      result << dir[0]
    end
    result += find_moves_in_direction(dir.drop(1))
  end

  def get_horizontals
    horizontal_left = []
    (0...pos[1]).each { |i| horizontal_left << [pos[0], i] }
    horizontal_right = []
    (pos[1] + 1...8).each { |i| horizontal_right << [pos[0], i] }
    vertical_top = []
    (0...pos[0]).each { |i| vertical_top << [i, pos[1]] }
    vertical_bottom = []
    (pos[0] + 1...8).each { |i| vertical_bottom << [i, pos[1]] }
    [horizontal_left, horizontal_right, vertical_top.reverse, vertical_bottom]
  end

  def get_top_diagonals
    diagonal_top_left = []
    i = 1
    until pos[0] - i < 0 || pos[1] - i < 0
      diagonal_top_left << [pos[0] - i, pos[1] - i]
      i += 1
    end
    diagonal_top_right = []
    i = 1
    until pos[0] - i < 1 || pos[1] + i > 8
      diagonal_top_right << [pos[0] - i, pos[1] + i]
      i += 1
    end
    [diagonal_top_left, diagonal_top_right]
  end

  def get_bottom_diagonals
    diagonal_bottom_left = []
    i = 1
    until pos[0] + i > 8 || pos[1] - i < 0
      diagonal_bottom_left  << [pos[0] + i, pos[1] - i]
      i += 1
    end
    diagonal_bottom_right = []
    i = 1
    until pos[0] + i > 8 || pos[1] + i > 8
      diagonal_bottom_right << [pos[0] + i, pos[1] + i]
      i += 1
    end
    [diagonal_bottom_left, diagonal_bottom_right]
  end

end


class SteppingPiece < Piece

  def moves
    moves_when_empty.reject do |space|
      @board[space] && @board[space].color == color
    end
  end

end

class Rook < SlidingPiece


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

class King < SteppingPiece

  DELTAS = [[1,0], [1,1], [-1,0], [-1,-1], [1,-1], [-1,1], [0,1], [0,-1]]

  def moves_when_empty
    result = DELTAS.map { |delta| [pos[0]+delta[0], pos[1]+delta[1]] }
    result
  end

end

class Knight < SteppingPiece

  DELTAS = [
    [-2, -1],
    [-2,  1],
    [-1, -2],
    [-1,  2],
    [ 1, -2],
    [ 1,  2],
    [ 2, -1],
    [ 2,  1]
  ]

  def moves_when_empty
    result = DELTAS.map { |delta| [pos[0]+delta[0], pos[1]+delta[1]] }
    result
  end
end

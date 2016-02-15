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
    
  end


end


class SteppingPiece < Piece

end

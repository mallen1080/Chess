class Piece

  attr_reader :pos, :board, :color

  def initialize(pos, board, color)
    @pos, @board, @color = pos, board, color
  end

  def move(pos)
    @pos = pos
  end

  def valid_move?(end_position)
    valid = true
    return false unless possible_moves.include?(end_position)
    piece = board[end_position]
    start = pos
    board.move_to(start, end_position)
    valid = false if board.in_check?(color)
    board.undo(start, end_position, piece)
    valid
  end

  def inspect
    @pos
  end

end


class NilClass

  def to_s
    "   "
  end

  def color
    nil
  end
end

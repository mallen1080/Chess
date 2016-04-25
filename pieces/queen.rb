require_relative 'piece'
require_relative 'slideable'

class Queen < Piece
  include Slideable

  def move_dirs
    get_horizontals + get_top_diagonals + get_bottom_diagonals
  end

  def to_s
    ' ♛ '.colorize(color)
  end

end

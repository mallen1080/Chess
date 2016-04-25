require_relative 'piece'
require_relative 'slideable'

class Rook < Piece
  include Slideable

  def move_dirs
    get_horizontals
  end

  def to_s
    " ♜ ".colorize(color)
  end

end

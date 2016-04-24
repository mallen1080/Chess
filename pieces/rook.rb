require_relative 'piece'
require_relative 'slideable'

class Rook < Piece
  include Slideable

  def move_dirs
    get_horizontals
  end

  def to_s
    return " ♜ " if color == :black
    return " ♖ " if color == :white
  end

end

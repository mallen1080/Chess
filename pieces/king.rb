require_relative 'piece'
require_relative 'stepable'

class King < Piece
  include Stepable
  
  DELTAS = [[1,0],
            [1,1],
            [-1,0],
            [-1,-1],
            [1,-1],
            [-1,1],
            [0,1],
            [0,-1]]

  def moves_when_empty
    result = DELTAS.map { |delta| [pos[0]+delta[0], pos[1]+delta[1]] }
    result.select! { |move| board.in_bounds?(move) }
    result
  end

  def to_s
    return " ♚ " if color == :black
    return " ♔ " if color == :white
  end

end

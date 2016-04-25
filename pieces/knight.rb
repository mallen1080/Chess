require_relative 'piece'
require_relative 'stepable'

class Knight < Piece
  include Stepable

  DELTAS = [[-2, -1],
            [-2,  1],
            [-1, -2],
            [-1,  2],
            [ 1, -2],
            [ 1,  2],
            [ 2, -1],
            [ 2,  1]]

  def moves_when_empty
    result = DELTAS.map do |delta|
      [pos[0]+delta[0], pos[1]+delta[1]]
    end
    result.select! { |move| board.in_bounds?(move) }
    result
  end

  def to_s
    " ♞ ".colorize(color)
  end

end

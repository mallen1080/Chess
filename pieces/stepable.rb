module Stepable

  def possible_moves
    moves_when_empty.reject do |space|
      @board[space] && @board[space].color == color
    end
  end
  
end

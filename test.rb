require_relative 'cursorable'
require_relative 'board'
require_relative 'display'
require_relative 'game'
require_relative 'piece'


board = Board.new
board.populate
d = Display.new(board)

board[[4, 4]] = Pawn.new([4,4], board, :white)
board[[3, 3]] = Pawn.new([3,3], board, :white)
board[[3, 5]] = Pawn.new([3,5], board, :black)
board[[3, 4]] = Pawn.new([3,4], board, :white)
board[[4, 4]].start = false
# p board[[4, 4]].moves
# p board[[4, 4]].moves.count
p board[[4,4]].moves

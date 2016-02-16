require_relative 'cursorable'
require_relative 'board'
require_relative 'display'
require_relative 'game'
require_relative 'piece'


board = Board.new
board.populate
d = Display.new(board)

board[[4, 4]] = Knight.new([4,4], board, :white)
# p board[[4, 4]].moves
# p board[[4, 4]].moves.count
p board[[4,4]].moves

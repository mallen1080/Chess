require_relative 'cursorable'
require_relative 'board'
require_relative 'display'
require_relative 'game'
require_relative 'piece'


board = Board.new
board.populate
d = Display.new(board)

board[[4, 4]] = Rook.new([4,4], board)
p board[[4, 4]].moves
# d.render

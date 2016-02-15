require_relative 'cursorable'
require_relative 'board'
require_relative 'display'
require_relative 'game'
require_relative 'piece'


board = Board.new
board.populate
board[[0,0]] = Piece.new([[0,0]], "C")

d = Display.new(board)
d.move

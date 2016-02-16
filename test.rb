require_relative 'cursorable'
require_relative 'board'
require_relative 'display'
require_relative 'game'
require_relative 'piece'


board = Board.new
board.populate
# d = Display.new(board)
# d.move

# board[[4, 4]] = King.new([4,4], board, :white)
board[[3, 3]] = Queen.new([3,3], board, :black)
# board.move([3,3], [4,3])
#board[[3, 5]] = Pawn.new([3,5], board, :white)
# board[[3, 4]] = Pawn.new([3,4], board, :white)
# board[[4, 4]].start = false
# p board[[4, 4]].moves
# p board[[4, 4]].moves.count
# p board[[4,4]].moves
# p board.in_check?(:white)
# p board.in_check?(:black)
p board[[6,0]].board

d = Display.new(board)
d.move

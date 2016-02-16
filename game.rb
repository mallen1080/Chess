class Game

  attr_reader :display

  def initialize
    @display = Display.new(Board.new)
  end

  def setup
    @display.board.populate
    # @display.board[[0,0]] = King.new([0,0], @display.board, :white)
    # @display.board[[6,2]] = Queen.new([6,2], @display.board, :white)
    # @display.board[[4,4]] = Rook.new([4,4], @display.board, :white)
    # @display.board[[7,0]] = King.new([7,0], @display.board, :black)
    # @display.board[[0,7]] = Pawn.new([0,7], @display.board, :black)
    puts "Welcome to Chess!"
  end

  def play
    setup
    loop do
      play_turn(:white)
      break if @display.board.checkmate?(:black)
      play_turn(:black)
      break if @display.board.checkmate?(:white)
    end
    puts "DONE"
  end

  def play_turn(color)
    begin
      #select piece
      move = nil
      until move && @display.board[move].color == color
        @display.render
        move = @display.get_input
      end
      start = move
      #make move
      move = nil
      until move
        @display.render
        move = @display.get_input
      end
      end_pos = move
      @display.board.move(start, end_pos)
    rescue ChessError => e
      puts e.message
      retry
    end
  end

end

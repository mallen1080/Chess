class Game

  attr_reader :display

  def initialize
    @board = Board.new
    @display = Display.new(@board)
  end

  def play
    setup
    loop do
      play_turn(:white)
      break if @board.checkmate?(:black)
      play_turn(:black)
      break if @board.checkmate?(:white)
    end
  end

  private

  def setup
    @board.populate
    puts "Welcome to Chess!"
  end

  def play_turn(color)
    move = nil
    until move && @board[move].color == color
      @display.render
      puts "#{color.capitalize}'s turn.  Select piece to move."
      move = @display.get_input
    end

    start = move
    piece = @board[move].class
    move = nil
    until move
      @display.render
      puts "#{piece} selected. Select where to move to."
      move = @display.get_input
    end

    end_pos = move
    @board.move(start, end_pos)
    rescue ChessError => e
    puts e.message
    retry
  end
end

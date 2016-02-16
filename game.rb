class Game

  attr_reader :display

  def initialize(display)
    @display = display
  end

  def board
    @display.board
  end

  def setup
    board.populate
    puts "Welcome to Chess!"
  end

  def play
    setup
    loop do
      play_turn(:white)
      break if board.checkmate?(:black)
      play_turn(:black)
      break if board.checkmate?(:white)
    end
    puts "DONE"
  end

  def play_turn(color)
    begin
      #select piece
      move = nil
      until move
        @display.render
        move = @display.get_input
        move = nil unless board[move].color == color
      end
      start = move
      #make move
      move = nil
      until move
        @display.render
        move = @display.get_input
      end
      end_pos = move
      board.move(start, end_pos)
    rescue ChessError => e
      puts e.message
      retry
    end
  end

end

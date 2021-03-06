class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) }
  end

  def populate
    populate_back_row(0, :black)
    @grid[1].each_index do |i|
      @grid[1][i] = Pawn.new([1,i], self, :black)
    end
    @grid[6].each_index do |i|
      @grid[6][i] = Pawn.new([6,i], self, :white)
    end
    populate_back_row(7, :white)
  end

  def populate_back_row(row_num, color)
    pieces = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]
    pieces.each_with_index do |piece, i|
      @grid[row_num][i] = piece.new([row_num, i], self, color)
    end
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, piece)
    x, y = pos
    @grid[x][y] = piece
  end

  def in_check?(color)
    @grid.flatten(1).each do |piece|
      next if piece.nil? || piece.color == color
      piece.possible_moves.each do |move|
        if (self[move].class == King && self[move].color == color)
          return true
        end
      end
    end
    false
  end

  def checkmate?(color)
    return false unless in_check?(color)
    @grid.flatten(1).each do |piece|
      next if piece.nil? || piece.color != color
      piece.possible_moves.each do |move|
        return false if piece.valid_move?(move)
      end
    end
    puts "Congratulations, #{color == :black ? :white : :black}!"
    return true
  end

  def undo(start_pos, end_pos, piece_at_end)
    move_to(end_pos, start_pos)
    if piece_at_end
      self[end_pos] = piece_at_end
      piece_at_end.move(end_pos)
    end
  end

  def in_bounds?(pos)
    x, y = pos
    return false unless (0...8).include?(x) && (0...8).include?(y)
    true
  end

  def move(start, end_pos)
    raise ChessError.new ("Invalid move") unless self[start].valid_move?(end_pos)
    move_to(start, end_pos)
    self[end_pos].start = false if self[end_pos].class == Pawn
  end

  def move_to(start, end_pos)
    self[end_pos] = self[start]
    self[start].move(end_pos)
    self[start] = nil
  end
end

class ChessError < StandardError
end

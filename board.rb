class Board
  attr_reader :grid

  def initialize()
    @grid = Array.new(8) { Array.new(8) }
  end

  def populate
    @grid[0].each_index do |i|
      @grid[0][i] = Piece.new([0,i])
    end
    @grid[1].each_index do |i|
      @grid[1][i] = Piece.new([1,i])
    end
    @grid[-2].each_index do |i|
      @grid[-2][i] = Piece.new([-2,i])
    end
    @grid[-1].each_index do |i|
      @grid[-1][i] = Piece.new([-1,i])
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

  def in_bounds?(pos)
    x, y = pos
    return false if !(0..8).include?(x) || !(0..8).include?(y)
    true
  end

  def move(start, end_pos)
    self[end_pos] = self[start]
    self[start].move(end_pos)
    self[start] = nil
  end
end

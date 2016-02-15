class Piece

  attr_reader :pos, :display, :value

  def initialize(pos, value="P")
    @pos = pos
    @value = value
  end

  def move(pos)
    @pos = pos
  end

  def to_s
    value
  end

end

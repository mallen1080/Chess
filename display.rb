require 'colorize'

class Display
  include Cursorable
  attr_reader :board, :cursor, :selected

  def initialize(board)
    @board = board
    @cursor = [0, 0]
    @selected = false
  end

  def render
    system("clear")
    build_grid.each { |row| puts row.join("") }
  end

private

  def build_grid
    board.grid.map.with_index do |row, i|
      build_row(row, i)
    end
  end

  def build_row(row, i)
    row.map.with_index do |piece, j|
      color_options = colors_for(i, j)
      piece.to_s.colorize(color_options)
    end
  end

  def colors_for(i, j)
    if [i, j] == @cursor
      bg = :red
    elsif (i + j).odd?
      bg = :light_blue
    else
      bg = :yellow
    end
    { background: bg }
  end
end

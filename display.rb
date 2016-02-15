require 'colorize'

class Display
  include Cursorable
  attr_reader :board, :cursor, :selected

  def initialize(board)
    @board = board
    @cursor = [0, 0]
    @selected = false
  end

  def build_grid
    @board.grid.map.with_index do |row, i|
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
      bg = :white
    elsif (i + j).odd?
      bg = :light_blue
    else
      bg = :light_green
    end
    { background: bg, color: :white }
  end

  def move
    move = nil
    until move
      render
      move = get_input
    end
    start = move

    move = nil
    until move
      render
      move = get_input
    end
    end_pos = move
    @board.move(start, end_pos)
    render
  end

  def render
    system("clear")
    build_grid.each { |row| puts "#{row.join("   ")} \n\n" }
  end


end

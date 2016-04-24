require_relative 'piece'

class Pawn < Piece
  attr_accessor :start

  def initialize(pos, board, color)
    super(pos, board, color)
    @start = true
  end

  def possible_moves
    result = []
    forward = color == :black ? [pos[0] + 1, pos[1]] : [pos[0] - 1, pos[1]]
    left_diagonal = color == :black ? [pos[0] + 1, pos[1] - 1] : [pos[0] - 1, pos[1] + 1]
    right_diagonal = color == :black ? [pos[0] + 1, pos[1] + 1] : [pos[0] - 1, pos[1] - 1]
    forward_start = color == :black ? [pos[0] + 2, pos[1]] : [pos[0] - 2, pos[1]]
    result << forward_start if start && @board[forward_start].nil?
    result << forward if @board[forward].nil?
    result << left_diagonal if @board[left_diagonal] && @board[left_diagonal].color != color
    result << right_diagonal if @board[right_diagonal] && @board[right_diagonal].color != color
    result.select { |move| board.in_bounds?(move) }
  end

  def to_s
    return " ♟ " if color == :black
    return " ♙ " if color == :white
  end
end

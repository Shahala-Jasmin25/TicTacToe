# This class represents the tictactpe board and its attributes
class Board
  attr_accessor :cells

  WINNING_SET = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8],
    [0, 3, 6], [1, 4, 7], [2, 5, 8],
    [0, 4, 8], [2, 4, 6]
  ].freeze

  def initialize
    @cells = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def show
    puts <<-HEREDOC
    \n
    |-----------|
    | #{@cells[0]} | #{@cells[1]} | #{@cells[2]} |
    |-----------|
    | #{@cells[3]} | #{@cells[4]} | #{@cells[5]} |
    |-----------|
    | #{@cells[6]} | #{@cells[7]} | #{@cells[8]} |
    |-----------|
    \n
    HEREDOC
  end

  def mark_cell(number, symbol)
    @cells[number - 1] = symbol
  end

  def cell_valid?(number)
    number.between?(1, 9) && @cells[number - 1] == number
  end

  def full?
    @cells.all? { |cell| cell =~ /[^0-9]/ }
  end

  def game_over?
    WINNING_SET.any? do |set| 
      [cells[set[0]], cells[set[1]], cells[set[2]]].uniq.length == 1
    end
  end
end

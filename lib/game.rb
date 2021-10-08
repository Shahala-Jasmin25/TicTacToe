require_relative 'board.rb'
require_relative 'display.rb'
require_relative 'player.rb'

# Class comparising all game methods and attributes
class Game
  include Display
  attr_accessor :first_player, :second_player, :current_player

  def initialize
    @board = Board.new
    @first_player = nil
    @second_player = nil
    @current_player = nil
  end

  def play
    puts display_game_intro
    @board.show
    @first_player = create_player(1)
    @second_player = create_player(2)
    @current_player = first_player
    next_set
  end

  def next_set
    @board.show
    turn
    if are_we_done?
      check_winner
    else
      switch_player
      next_set
    end
  end

  def turn
    puts choose_cell(@current_player.name)
    cell = gets.chomp.to_i
    unless @board.cell_valid?(cell)
      puts invalid_cell
      turn
    end
    @board.mark_cell(cell, @current_player.symbol)
  end

  def create_player(number)
    name = fetch_player_name(number)
    symbol = fetch_player_symbol(number, name)
    player = Player.new(name, symbol)
    player
  end

  def are_we_done?
    @board.game_over? || @board.full?
  end

  def check_winner
    @board.show
    if @board.game_over?
      puts display_winner(@current_player.name)
    else
      puts display_tie
    end
  end

  def switch_player
    @current_player = @current_player == first_player ? second_player : first_player
  end

  def fetch_player_name(number)
    puts display_player_entry(number)
    name = gets.chomp
    return name if number == 1

    if @first_player.name == name
      puts duplicate_name
      fetch_player_name(number)
    end
    name
  end

  def fetch_player_symbol(number, name)
    puts display_symbol_entry(name)
    symbol = gets.chomp
    return symbol if symbol_valid?(number, symbol)

    puts invalid_symbol
    fetch_player_symbol(number, name)
  end

  def symbol_valid?(number, symbol)
    !symbol.count('^0-9').zero? && (number == 1 || @first_player.symbol != symbol)
  end
end

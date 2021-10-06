# Module comprising all diplays
module Display
  def display_game_intro
    'Welcome to Tic Tac Toe\n'\
  end

  def display_player_entry(number)
    "Enter name for player #{number}"
  end

  def display_symbol_entry(name)
    'Enter a letter or special character (Please avoid numbers)'\
    "to be used as a symbol for #{name}"
  end

  def duplicate_name
    'Player name already taken'
  end

  def invalid_symbol
    'Symbol not allowed'
  end

  def choose_cell(name)
    "#{name} please choose a valid cell"
  end

  def invalid_cell
    'Don\'t you have eyes? Choose a valid cell'
  end

  def display_winner(winner)
    "CONGRATS #{winner.upcase}!!! YOU WON"
  end

  def display_tie
    'ITS A TIE'
  end
end

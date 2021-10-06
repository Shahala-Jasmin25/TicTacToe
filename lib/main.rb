# The main control
require_relative 'game.rb'

def start_game
  game = Game.new
  game.play
end

start_game

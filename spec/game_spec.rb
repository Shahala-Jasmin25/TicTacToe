require_relative '../lib/game'

describe Game do
  subject(:game) { described_class.new }

  before do
    game.instance_variable_set(:@board, instance_double(Board))
  end

  describe '#create_player' do
    it 'Create a new player' do
      player_name = 'Professor'
      player_symbol = 'x'
      allow(game).to receive(:puts)
      allow(game).to receive(:display_player_entry).with(1)
      allow(game).to receive(:gets).and_return(player_name)
      allow(game).to receive(:fetch_player_symbol).and_return(player_symbol)
      expect(Player).to receive(:new).with(player_name, player_symbol)
      game.create_player(1)
    end
  end
end

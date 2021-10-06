require 'rspec'
require_relative '../lib/board'

describe Board do
  subject(:board) { described_class.new}

  describe '#mark_cell' do
    it 'mark cell value [index]' do
      player_input = 1
      player_symbol = 'x'
      board.mark_cell(player_input, player_symbol)
      updated_board = board.cells
      expected_board_state = ['x', 2, 3, 4, 5, 6, 7, 8, 9]
      expect(updated_board).to eq expected_board_state
    end
  end

  describe '#valid_cell?' do
    context 'When entered cell value is out of scope' do
      it 'not a valid move' do
        player_input = 10
        result = board.cell_valid?(player_input)
        expect(result).to eq false
      end
    end

    context 'When entered cell value is already marked' do
      before do
        board.instance_variable_set(:@cells, ['x', 2, 'o', 4, 5, 'o', 'x', 8, 'o'])
      end
      it 'not a valid move' do
        player_input = 3
        result = board.cell_valid?(player_input)
        expect(result).to eq false
      end
    end

    context 'When entered cell open' do
      it 'not a valid move' do
        player_input = 2
        result = board.cell_valid?(player_input)
        expect(result).to eq true
      end
    end
  end

  describe '#full?' do
    context 'When board is new' do
      it 'not full' do
        expect(board).not_to be_full
      end
    end

    context 'When board is partially full' do
      before do
        board.instance_variable_set(:@cells, ['x', 2, 'o', 4, 5, 'o', 'x', 8, 'o'])
      end

      it 'not full' do
        expect(board).not_to be_full
      end
    end

    context 'When board is full' do
      before do
        board.instance_variable_set(:@cells, %w([x] [x] [o] [o] [o] [x] [x] [x] [x]))
      end

      it 'is full' do
        expect(board).to be_full
      end
    end
  end

  describe '#game_over?' do
    context 'When board is new' do
      it 'not over' do
        expect(board).not_to be_game_over
      end
    end

    context 'When board has no winning set' do
      before do
        board.instance_variable_set(:@cells, ['x', 2, 'o', 4, 5, 'o', 'x', 8, 'x'])
      end
      it 'not over' do
        expect(board).not_to be_game_over
      end
    end

    context 'When board has a winning set' do
      before do
        board.instance_variable_set(:@cells, ['x', 2, 'o', 4, 5, 'o', 'x', 8, 'o'])
      end
      it 'game over' do
        expect(board).to be_game_over
      end
    end
  end
end

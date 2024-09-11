require './spec/spec_helper'

RSpec.describe Turns do
    before(:each) do
        @computer_turn = Turns.new
        @player_turn = Turns.new
    end

    it 'exists' do
        expect(@computer_turn).to be_an_instance_of(Turns)
        expect(@player_turn).to be_an_instance_of(Turns)
    end
    it 'computer can place ships' do
    @computer_turn.computer_place_ships(@computer_cruiser, @computer_submarine)
    expect(@computer_board.valid_placement(@computer_cruiser, @computer_cruiser_arr)).to eq true
    expect(@computer_board.valid_placement(@computer_submarine, @computer_submarine_arr)).to eq true
    end
end
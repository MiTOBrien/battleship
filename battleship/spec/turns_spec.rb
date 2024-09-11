require './spec/spec_helper'
# binding.pry
RSpec.describe Turns do
    before(:each) do
        @computer_turn = Turns.new
        @player_turn = Turns.new
        @computer_board = Board.new
    end

    it 'exists' do
        expect(@computer_turn).to be_an_instance_of(Turns)
        expect(@player_turn).to be_an_instance_of(Turns)
        expect(@computer_board).to be_an_instance_of(Board)
    end
    it 'computer can place ships' do
    @computer_turn.computer_place_ships(@computer_cruiser, @computer_submarine)
    
    end
end
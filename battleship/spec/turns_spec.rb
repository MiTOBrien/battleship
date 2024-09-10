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
end
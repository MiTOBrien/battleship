require './spec/spec_helper'

RSpec.describe Board do
    before(:each) do
        @board = Board.new
        @cruiser = Ship.new("Cruiser", 3)
        @submarine = Ship.new("Submarine", 2)
    end

    it 'exists' do
        expect(@board).to be_an_instance_of(Board)
    end
end

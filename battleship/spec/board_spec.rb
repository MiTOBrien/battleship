require './spec/spec_helper'

RSpec.describe Board do
    before(:each) do
        @board = Board.new
        @cruiser = Ship.new("Cruiser", 3)
        @submarine = Ship.new("Submarine", 2)
    end

    it 'exists' do
        expect(@board).to be_an_instance_of(Board)
        expect(@board.cells).to be_a(Hash)
    end

    it 'can identify valid coordinates' do
        expect(@board.valid_coordinate?("E1")).to be(false)
        expect(@board.valid_coordinate?("A16")).to be(false)
        expect(@board.valid_coordinate?("B1")).to be(true)
        expect(@board.valid_coordinate?("D4")).to be(true)
    end

    it 'can identify valid ship placement' do
        expect(@board.valid_placement?(cruiser, ["A1", "B2", "C3"])).to be(false)
        expect(@board.valid_placement?(submarine, ["A2", "A3", "A4"])).to be(false)
        expect(@board.valid_placement?(submarine, ["A1", "C1"])).to be(false)
        expect(@board.valid_placement?(submarine, ["A1", "A2"])).to be(true)
        expect(@board.valid_placement?(cruiser, ["B1", "C1", "D1"])).to be(true)
    end

end

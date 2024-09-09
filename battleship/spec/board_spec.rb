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
        expect(@board.cells.empty?).to eq(false)
    end

    it 'can identify valid coordinates' do
        expect(@board.valid_coordinate?(['B1', "c1", "D1"])).to be(true)
        expect(@board.valid_coordinate?(["D1", "d2", "d3"])).to be(true)
        expect(@board.valid_coordinate?(["A3", "E1", "D2"])).to eq("Those are invalid coordinates. Please try again:")
        expect(@board.valid_coordinate?(["4A"])).to eq("Those are invalid coordinates. Please try again:")
    end

    it 'can identify valid ship placement' do
        # Test valid length - Pass and Fail
        expect(@board.valid_placement?(@cruiser, ["A1", "A2"])).to be(false)
        expect(@board.valid_placement?(@submarine, ["C2", "C3", "C4"])).to be(false)
        expect(@board.valid_placement?(@cruiser, ["B1", "B2", "B3"])).to be(true)
        expect(@board.valid_placement?(@submarine, ["D2", "D3"])).to be(true)

        # Test Consecutive - Fail
        expect(@board.valid_placement?(@cruiser, ["A1", "A2", "A4"])).to be(false)
        expect(@board.valid_placement?(@submarine, ["A1", "C1"])).to be(false)
        expect(@board.valid_placement?(@cruiser, ["A3", "A2", "A1"])).to be(false)
        expect(@board.valid_placement?(@submarine, ["C1", "B1"])).to be(false)
        
        #Test Diagonal - Fail
        expect(@board.valid_placement?(@cruiser, ["A1", "B2", "C3"])).to be(false)
        expect(@board.valid_placement?(@submarine, ["C2", "D3"])).to be(false)

        #Valid Placements - Pass
        expect(@board.valid_placement?(@cruiser, ["B1", "B2", "B3"])).to be(true)
        expect(@board.valid_placement?(@submarine, ["D2", "D3"])).to be(true)
    end

    it 'can render the board' do
        expect(@board.render).to eq("  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n")

    end

    it 'can place ships on the board with interactions' do
        @board.place(@cruiser, ["A1", "A2", "A3"])    

        expect(@board.render(true)).to eq("  1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . . \n")
    end
end

require './lib/ship'
require './lib/cell'

RSpec.describe Cell do
    before(:each) do
        @cell = Cell.new("B4")
        @cruiser = Ship.new("Cruiser", 3)
    end

    it 'exists and can initialize variables' do
        expect(@cell).to be_an_instance_of(Cell)
        expect(@cell.coordinate).to eq("B4")
        expect(@cell.ship).to eq(nil)
        expect(@cell.empty?).to eq(true)
    end

    it 'can place a ship' do
        @cell.place_ship(@cruiser)
        expect(@cell.empty?).to eq(false)
    end

    it 'can verify if a cell has been fired upon' do
        expect(@cell.fired_upon?).to eq(false)

        @cell.fire_upon
        expect(@cell.fired_upon?).to eq(true)
        # Need to add the test for the Cruiser being hit and its health decreasing to 2
    end
end
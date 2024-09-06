#require 'pry';binding.pry
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
        expect(@cell.ship).to eq(@cruiser)
    end

    it 'can verify if a cell has been fired upon' do
        expect(@cell.fired_upon?).to eq(false)

        @cell.place_ship(@cruiser)

        @cell.fire_upon
        expect(@cell.fired_upon?).to eq(true)
        expect(@cell.ship.health).to eq(2)
    end
end
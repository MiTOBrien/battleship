require './spec/spec_helper'

RSpec.describe Cell do
    before(:each) do
        @cell_1 = Cell.new("B4")
        @cell_2 = Cell.new("C3")
        @cruiser = Ship.new("Cruiser", 3)
    end

    it 'exists and can initialize variables' do
        expect(@cell_1).to be_an_instance_of(Cell)
        expect(@cell_1.coordinate).to eq("B4")
        expect(@cell_1.ship).to eq(nil)
        expect(@cell_1.empty?).to eq(true)
    end

    it 'can place a ship' do
        @cell_1.place_ship(@cruiser)
        expect(@cell_1.empty?).to eq(false)
        expect(@cell_1.ship).to eq(@cruiser)
    end

    it 'can verify if a cell has been fired upon' do
        expect(@cell_1.fired_upon?).to eq(false)

        @cell_1.place_ship(@cruiser)

        @cell_1.fire_upon
        expect(@cell_1.fired_upon?).to eq(true)
        expect(@cell_1.ship.health).to eq(2)
    end

    it 'can render cells correctly' do
        expect(@cell_1.render).to eq(".")

        @cell_1.fire_upon
        expect(@cell_1.render).to eq("M")
    end

    it 'can render cells with ships' do
        @submarine = Ship.new("Submarine", 2)
       
        @cell_1.place_ship(@cruiser)
        @cell_2.place_ship(@submarine)

        expect(@cell_1.render(true)).to eq("S")

        @cell_1.fire_upon
        @cell_1.fire_upon
        @cell_1.fire_upon
        expect(@cell_1.ship.health).to eq(0)

        @cell_2.fire_upon

        expect(@cell_1.render).to eq("X")
        expect(@cell_2.render).to eq("H")

    end

       
end
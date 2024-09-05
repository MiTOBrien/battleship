require './lib/ship'

RSpec.describe Ship do
    it 'exists' do
        ship = Ship.new("Cruiser", 3)

        expect(ship).to be_an_instance_of(Ship)
        expect(ship.name).to eq("Cruiser")
        expect(ship.length).to eq(3)
    end
end
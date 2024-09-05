require './lib/ship'

RSpec.describe Ship do
    before(:each) do
        @cruiser = Ship.new("Cruiser", 3)
        @submarine = Ship.new("Submarine", 2)
    end

    it 'exists' do
        expect(@cruiser).to be_an_instance_of(Ship)
        expect(@cruiser.name).to eq("Cruiser")
        expect(@cruiser.length).to eq(3)
        expect(@cruiser.health).to eq(3)
    end

    it "Sunk? should be false to start the game" do
        expect(@cruiser.sunk?).to be(false)
    end
end
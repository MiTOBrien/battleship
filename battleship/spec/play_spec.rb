require './spec/spec_helper'

RSpec.describe Play do
    it 'exists' do
        play_game = Play.new
        expect(play_game).to be_an_instance_of(Play)
    end
end
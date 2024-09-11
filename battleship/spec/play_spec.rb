require './spec/spec_helper'

RSpec.describe Play do
    it 'exists' do
        play_game = Play.new
        player_board = Board.new
        expect(play_game).to be_an_instance_of(Play)
        expect(player_board).to be_an_instance_of(Board)
    end
end
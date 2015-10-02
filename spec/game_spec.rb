require "rspec"
require "stringio"
require "game"
require "user_interface"

class HumanPlayer
end

describe Game do
  let(:output) {StringIO.new}
  let(:game) { Game.new(output,input) }
  let(:input) {StringIO.new}
  let(:ui) {UserInterface.new(output,board)}
  let(:board) {Board.new(3,3)}

  describe "#number_of_players" do
    it "takes a player input of 1" do

      expect(game.number_of_players(1)).to eq(1)
    end

    it "takes player input of 2" do

      expect(game.number_of_players(2)).to eq(2)
    end
  end

  describe "#create_players" do
    it "creates two human players" do
      player_array = []
      @player1 = HumanPlayer.new
      @player2 = HumanPlayer.new
      player_array << @player1
      player_array << @player2

      game.create_players(2)

      expect(player_array[0]).to be_instance_of HumanPlayer
      expect(player_array[1]).to be_instance_of HumanPlayer
    end
  end
end

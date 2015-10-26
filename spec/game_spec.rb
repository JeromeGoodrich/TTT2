require "rspec"
require "game"
require "board"
require "user_interface"
require "player_selector"

describe Game do
  let(:game) {Game.new(ui,player_selector,board)}
  let(:ui) {UserInterface.new(output,board)}
  let(:player_selector) {PlayerSelector.new}
  let(:board) {Board.new(9)}

  describe "#name_players" do
    it "gives names to each player" do
      players = player_selector.select(2)

      game.name_players(players,"Jerome","Sol")

      expect(players[0].name).to eq("Jerome")
      expect(players[1].name).to eq("Sol")
    end
  end

  describe "#assign_token" do
    it "assigns a token to each human player" do
      players = player_selector.select(2)
      tokens = ["x","o"]

      game.assign_token(players,"x","o")

      expect(players[0].token).to eq("x")
      expect(players[1].token).to eq("o")
    end

    it "assigns a token to human player and cpu" do
      players = player_selector.select(1)
      tokens = ["x","o"]

      game.assign_token(players,"x","o")

      expect(players[0].token).to eq("x")
      expect(players[1].token).to eq("o")
    end


  end
end

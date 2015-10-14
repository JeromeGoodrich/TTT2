require "rspec"
require "game"
require "board"
require "stringio"
require "user_interface"
require "human_player"
require "computer_player"

describe Game do
  let(:game) {Game.new(ui,player1,player2, computer_player)}
  let(:ui) {UserInterface.new(output,board)}
  let(:board) {Board.new(9)}
  let(:output) {StringIO.new}
  let(:player1) {HumanPlayer.new}
  let(:player2) {HumanPlayer.new}
  let(:computer_player) {ComputerPlayer.new}
  let(:players) {[computer_player, player1]}

  describe "#create_players" do
    it "creates 2 human players for the game" do
      expect(game.create_players(2)).to eq([player1,player2])
    end

    it "it create a human and computer player for the game" do
      expect(game.create_players(1)).to eq([player1, computer_player])
    end
  end

  describe "#name_players" do
    it "gives names to each player" do
      players = [player1,player2]

      game.name_players(players,"Jerome","Sol")

      expect(player1.name).to eq("Jerome")
      expect(player2.name).to eq("Sol")
    end
  end

  describe "#assign_token" do
    it "assigns a token to each human player" do
      players = [player1,player2]
      tokens = ["x","o"]

      game.assign_token(players,"x","o")

      expect(player1.token).to eq("x")
      expect(player2.token).to eq("o")
    end

    it "assigns a token to human player and cpu" do
      players = [player1,computer_player]
      tokens = ["x","o"]

      game.assign_token(players,"x","o")

      expect(player1.token).to eq("x")
      expect(computer_player.token).to eq("o")
    end
  end

  describe "#get_move" do
    it "gets a move from each player" do
      player = player1
      move = 5

      game.get_move(player, move)

      expect(player1.move).to eq(5)
    end
  end
end

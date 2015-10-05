require "rspec"
require "game"
require "board"
require "stringio"
require "user_interface"
require "human_player"


describe Game do
  let(:game) {Game.new(ui,player1,player2)}
  let(:ui) {UserInterface.new(output,board)}
  let(:board) {Board.new(9)}
  let(:output) {StringIO.new}
  let(:player1) {HumanPlayer.new}
  let(:player2) {HumanPlayer.new}

  it "runs the game"

  describe "#create_players" do
    it "creates players for the game" do
      expect(game.create_players(2)).to eq([player1,player2])
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
    it "assigns a token to each player" do
      players = [player1,player2]
      tokens = ["x","o"]

      game.assign_token(players,"x","o")

      expect(player1.token).to eq("x")
      expect(player2.token).to eq("o")
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

  it "assigns a token to the computer"

  it "will choose the winning move if given the option"

  it "will block an opponent"

  it "will create a fork"

  it "will block the opponents fork by creating two in a row"

  it "will block the opponents fork if there is a chance for them to make one on the following move"

  it "will play the center when not needing to win, block, fork, or block a fork"

  it "will play the the opposite corner when the opponent plays a corner and none of the conditions above are met"

  it "will play a corner if none of the above conditions are met"

  it "will play a side space if none of the above conditions are met"

end

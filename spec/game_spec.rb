require "rspec"
require "game"
require "board"
require "stringio"
require "user_interface"

class HumanPlayer
  attr_accessor :name, :token, :move
end

describe Game do
  let(:game) {Game.new(ui,player1,player2)}
  let(:ui) {UserInterface.new(output,board)}
  let(:board) {Board.new(9)}
  let(:output) {StringIO.new}
  let(:player1) {HumanPlayer.new}
  let(:player2) {HumanPlayer.new}

  it "runs the game"

  it "creates players for the game" do
    expect(game.create_players(2)).to eq([player1,player2])
  end

  it "gives names to each player" do
    players = [player1,player2]

    game.name_players(players,"Jerome","Sol")

    expect(player1.name).to eq("Jerome")
    expect(player2.name).to eq("Sol")
  end

  it "assigns a token to each player" do
    players = [player1,player2]
    tokens = ["x","o"]

    game.assign_token(players,"x","o")

    expect(player1.token).to eq("x")
    expect(player2.token).to eq("o")
  end

  it "gets a move from each player" do
    player = player1
    move = 5

    game.get_move(player, move)

    expect(player1.move).to eq(5)
  end
end

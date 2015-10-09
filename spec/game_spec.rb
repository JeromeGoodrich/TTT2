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


  it "runs the game"

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

  it "will move to a corner when the board is empty" do
    computer_player.evaluate_board(board)

    expect([1,3,7,9]).to include(computer_player.best_move)
  end

  it "will take only available position" do
    board.set_move(1, "x").set_move(2, "x").set_move(3, "o")
         .set_move(4, "o").set_move(5, "o").set_move(6, "x")
         .set_move(7, "x").set_move(9, "o")
    computer_player.evaluate_board(board)

    expect(computer_player.best_move).to eq(8)
  end

  it "will choose the winning move if given the option" do
    board.set_move(1,"x").set_move(2,"o").set_move(4,"x").set_move(9,"o")

    computer_player.evaluate_board(board)

    expect(computer_player.best_move).to eq(7)
  end

  it "will block the winning move if given the option" do
    board.set_move(1,"x").set_move(2,"o").set_move(3,"x").set_move(8,"o")

    computer_player.evaluate_board(board)

    expect(computer_player.best_move).to eq(5)
  end

  it "will prioritize creating a fork if winning or blocking are not options" do
    board.set_move(1,"x").set_move(3,"o").set_move(7, "x").set_move(4, "o")

    computer_player.evaluate_board(board)

    expect(computer_player.best_move).to eq(9)
  end

  it "will prioritize creating a fork if winning or blocking are not options" do
    board.set_move(1,"x").set_move(7,"o").set_move(3, "x").set_move(2, "o")

    computer_player.evaluate_board(board)

    expect(computer_player.best_move).to eq(9)
  end

  it "will prioritize creating a fork if winning or blocking are not options" do
    board.set_move(1,"x").set_move(9,"o").set_move(7, "x").set_move(4, "o")

    computer_player.evaluate_board(board)

    expect(computer_player.best_move).to eq(3)
  end

  it "will prioritize creating a fork if winning or blocking are not options" do
    board.set_move(1,"x").set_move(9,"o").set_move(3, "x").set_move(2, "o")

    computer_player.evaluate_board(board)

    expect(computer_player.best_move).to eq(7)
  end

  it "will prioritize creating a fork if winning or blocking are not options" do
    board.set_move(1,"x").set_move(2,"o").set_move(5, "x").set_move(9, "o")

    computer_player.evaluate_board(board)

    expect(computer_player.best_move).to eq(7)
  end

  it "will return 10 in a winning terminal game state" do
    board.set_move(1,"x").set_move(2,"o").set_move(5, "x").set_move(9,"o").set_move(7, "x").set_move(4,"o").      set_move(3,"x")

    expect(computer_player.score(board)).to eq(10)
  end

  it "will return 0 in a tied terminal game state" do
    board.set_move(1,"x").set_move(2,"o").set_move(5, "x").set_move(9,"o").set_move(7, "x").set_move(4,"o").      set_move(6,"x").set_move(3,"o").set_move(8,"x")

    expect(computer_player.score(board)).to eq(0)
  end

  it "will return -10 in a losing terminal game state"






  it "will block an opponents fork by creating two in a row"

  it "will block an opponent"

  it "will create a fork"

  it "will block the opponents fork by creating two in a row"

  it "will block the opponents fork if there is a chance for them to make one on the following move"

  it "will play the center when not needing to win, block, fork, or block a fork"

  it "will play the the opposite corner when the opponent plays a corner and none of the conditions above are met"

  it "will play a corner if none of the above conditions are met"

  it "will play a side space if none of the above conditions are met"

end

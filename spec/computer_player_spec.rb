require "rspec"
require "computer_player"
require "board"

describe ComputerPlayer do
  let (:computer_player) {ComputerPlayer.new}
  let (:board)  {Board.new(9)}

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

  xit "will block the winning move if given the option" do
    board.set_move(1,"x").set_move(2,"o").set_move(3,"x").set_move(8,"o")
    computer_player.token = "x"

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

  it "will return -10 in a losing terminal game state" do
    board.set_move(1,"x").set_move(3,"o").set_move(8,"x").set_move(5,"o").set_move(2, "x").set_move(7,"o")

    expect(computer_player.score(board)).to eq(-10)
  end
end

require "rspec"
require "board"

describe Board do
  let(:board) {Board.new(9)}
  let(:board4x4) {Board.new(16)}
  let(:board9x9) {Board.new(81)}

  describe "#set_move" do
    it "allows a player to make a move on the board by inputing the number of a space " do
      board.set_move(1, "x")

      expect(board.read_move(1)).to eq("x")
    end
  end

  describe "#set_move" do
    it "returns itself " do
      same_board = board.set_move(1, "x")

      expect(board).to eq(same_board)
    end
  end

  describe "#available_spaces" do
    it "returns an array of available spaces" do
      board.set_move(1,"x")

      expect(board.available_spaces).to eq([2,3,4,5,6,7,8,9])
    end
  end

  describe "#winning_row" do
    it "declares a winner if a row is filled by the same token on a 3x3 board" do
      board.set_move(1,"x").set_move(4,"o").set_move(7,"x").set_move(5,"o").set_move(3,"x").set_move(6,"o")

      expect(board.winning_row).to eq("o")
    end

    it "declares a winner if a row is filled by the same token on a 4x4 board" do
      board4x4.set_move(5,"x").set_move(4,"o").set_move(6,"x").set_move(1,"o").set_move(7,"x").set_move(3,"o")      .set_move(8,"x")

      expect(board4x4.winning_row).to eq("x")
    end

    it "declares a winner if a row is filled by the same token on a 9x9 board" do
      board9x9.set_move(10,"x").set_move(1,"o").set_move(11,"x").set_move(2,"o").set_move(12,"x").set_move(3,"o")      .set_move(13,"x").set_move(4,"o").set_move(14,"x").set_move(5,"o").set_move(15,"x").set_move(6,"o")      .set_move(16,"x").set_move(7,"o").set_move(17,"x").set_move(8,"o").set_move(20,"x").set_move(9,"o")

      expect(board9x9.winning_row).to eq("o")
    end
  end

  describe "#winning_column" do
    it "declares a winner if a column is filled by the same token on a 3x3 board" do
      board.set_move(1,"x").set_move(2,"o").set_move(7,"x").set_move(5,"o").set_move(3,"x").set_move(8,"o")

      expect(board.winning_column).to eq("o")
    end

    it "declares a winner if a column is filled by the same token on a 4x4 board" do
      board4x4.set_move(2,"x").set_move(4,"o").set_move(6,"x").set_move(1,"o").set_move(10,"x").set_move(3,"o")      .set_move(14,"x")

      expect(board4x4.winning_column).to eq("x")
    end

    it "declares a winner if a column is filled by the same token on a 9x9 board" do
      board9x9.set_move(20,"x").set_move(1,"o").set_move(11,"x").set_move(10,"o").set_move(12,"x")
              .set_move(19,"o").set_move(13,"x").set_move(28,"o").set_move(14,"x").set_move(37,"o")
              .set_move(15,"x").set_move(46,"o").set_move(16,"x").set_move(55,"o").set_move(17,"x")
              .set_move(64,"o").set_move(30,"x").set_move(73,"o")

      expect(board9x9.winning_column).to eq("o")
    end
  end

  describe "#winning_diagonal" do
    it "declares a winner if a diagonal is filled by the same token on a 3x3 board" do
      board.set_move(1,"x").set_move(4,"o").set_move(5,"x").set_move(3,"o").set_move(9,"x")

      expect(board.winning_diagonal).to eq("x")
    end

    it "declares a winner if a diagonal is filled by the same token on a 4x4 board" do
      board4x4.set_move(1,"x").set_move(4,"o").set_move(6,"x").set_move(2,"o").set_move(11,"x").set_move(3,"o")      .set_move(16,"x")

      expect(board4x4.winning_diagonal).to eq("x")
    end

    it "declares a winner if a diagonal is filled by the same token on a 4x4 board" do
      board9x9.set_move(20,"x").set_move(1,"o").set_move(15,"x").set_move(11,"o").set_move(12,"x")
              .set_move(21,"o").set_move(13,"x").set_move(31,"o").set_move(14,"x").set_move(41,"o")
              .set_move(67,"x").set_move(51,"o").set_move(16,"x").set_move(61,"o").set_move(17,"x")
              .set_move(71,"o").set_move(30,"x").set_move(81,"o")

      expect(board9x9.winning_diagonal).to eq("o")
    end
  end

  describe "#tie_game?" do
    it "declares a tie when all the spaces on the board are marked and no winner has been declared" do
      board.set_move(1,"x").set_move(2,"o").set_move(3,"x").set_move(4,"o").set_move(5,"x").set_move(6,"x").set_move(7,"o").set_move(8,"x").set_move(9,"o")

      expect(board.tie_game?).to eq(true)
    end
  end
end

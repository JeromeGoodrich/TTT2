require "rspec"
require "board"

describe Board do
  let(:board) {Board.new(9)}

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

  describe "#winning_row?" do
    it "declares a winner if any row is marked by the same 3 tokens" do
      board.set_move(4,"o")
      board.set_move(5,"o")
      board.set_move(6,"o")

      expect(board.winning_row?).to eq(true)
    end
  end

  describe "#winning_column?" do
    it "declares a winner if any column is marked by the same 3 tokens" do
      board.set_move(1,"o")
      board.set_move(4,"o")
      board.set_move(7,"o")

      expect(board.winning_column?).to eq(true)
    end
  end

  describe "#winning_diagonal?" do
    it "declares a winner if any diagonal is marked by the same 3 tokens" do
      board.set_move(3,"o")
      board.set_move(5,"o")
      board.set_move(7,"o")

      expect(board.winning_diagonal?).to eq(true)
    end
  end

  describe "#tie_game?" do
    it "declares a tie when all the spaces on the board are marked and no winner has been declared" do
      board.set_move(1,"x")
      board.set_move(2,"o")
      board.set_move(3,"x")
      board.set_move(4,"o")
      board.set_move(5,"x")
      board.set_move(6,"x")
      board.set_move(7,"o")
      board.set_move(8,"x")
      board.set_move(9,"o")

      expect(board.tie_game?).to eq(true)
    end
  end
end

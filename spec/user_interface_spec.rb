require "rspec"
require "user_interface"
require "stringio"
require "board"

describe UserInterface do
  let(:ui) {UserInterface.new(output,board)}
  let(:board) {Board.new(3,3)}
  let(:output) {StringIO.new}

  describe "#greeting" do
    it "returns \'Welcome to Tic Tac Toe\'" do
      ui.greeting

      expect(output.string).to eq("Welcome to TicTacToe")
    end
  end

  describe "#player_number" do
    it "asks how many players will play" do
      ui.player_number

      expect(output.string).to include('how many players will be playing?')
    end
  end

  describe "#player_name" do
    it "asks the player to input their name" do
      ui.player_name

      expect(output.string).to include("please type your name")
    end
  end

  describe "#which_token" do
    it "asks the first player which token they would like to play with" do
      ui.which_token

      expect(output.string).to include("would you like to play with x or o")
    end
  end

  describe "#prompt_move" do
    it "asks the first player to make a move" do
      ui.prompt_move

      expect(output.string).to include("Player 1, make your move")
    end
  end

  describe "#print_board" do
    it "it prints out the board with first player's move" do
      board.set_move(1,"x")

      ui.print_board

      expect(output.string).to include("x|2|3\n4|5|6\n7|8|9\n")
    end

    it "marks the second player's move on the board" do
      board.set_move(1,"x")
      board.set_move(3,"o")

      ui.print_board

      expect(output.string).to include("x|2|o\n4|5|6\n7|8|9\n")
    end
  end

  describe "#computer_thinking" do
    it "says 'the computer is thinking...'" do
      ui.computer_thinking

      expect(output.string).to include("the computer is thinking...")
    end
  end

  describe "#get_user_input" do
    $stdin = StringIO.new("some input")

    it "returns the player's input" do
      expect(ui.get_user_input).to eq("some input")
    end
  end


end

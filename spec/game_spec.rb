require "rspec"
require "stringio"
require "game"
require "user_interface"

class HumanPlayer
end

class Board

  def initialize(rows,columns)
    @rows = rows
    @columns = columns
    @board = (1..(@rows*@columns)).to_a
  end

  def set_move(space, token)
    if available_spaces.include?(space)
      @board[(space-1)] = token
    else
      #this is not great design but I can't figure out how get rid of it right now
      return "invalid move"
      set_move(space, token)
    end
  end

  def read_move(space)
    @board[(space-1)]
  end

  def available_spaces
    @board - ["x","o"]
  end
end

describe Game do
  let(:output) {StringIO.new}
  let(:game) { Game.new(output,input) }
  let(:input) {StringIO.new}
  let(:ui) {UserInterface.new(output,board)}
  let(:board) {Board.new(3,3)}

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

  describe "#player_name" do
    it "asks the player to input their name" do
      ui.player_name

      expect(output.string).to include("please type your name")
    end
  end

  describe "#get_user_input" do
    $stdin = StringIO.new("some input")

    it "returns the player's input" do
      expect(ui.get_user_input).to eq("some input")
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

  it "creates a board with specified dimensions" do

    expect(board).to be_instance_of Board
  end

  it "allows a player to make a move on the board by inputing the number of a space " do

    board.set_move(1, "x")

    expect(board.read_move(1)).to eq("x")
  end

  it "it prints out the board with the marked move" do
    board.set_move(1,"x")

    ui.print_board

    expect(output.string).to include("x|2|3\n4|5|6\n7|8|9\n")
  end

#   it "asks the second player to make a move"

  it "says 'the computer is thinking...'" do
    ui.computer_thinking

    expect(output.string).to include("the computer is thinking...")
  end

  it "marks the second player's move on the board" do
    board.set_move(1,"x")
    board.set_move(3,"o")

    ui.print_board

    expect(output.string).to include("x|2|o\n4|5|6\n7|8|9\n")
  end

  it "prevents a space from being marked twice" do
    board.set_move(1,"x")

    expect(board.set_move(1,"o")).to eq("invalid move")
  end

  it "returns an array of available spaces" do
    board.set_move(1,"x")

    expect(board.available_spaces).to eq([2,3,4,5,6,7,8,9])
  end

#   it "loops through the game sequence until the game is over"

#   it "ends the game if all the spaces on the board are marked"

#   it "declares a winner if any row is marked by the same 3 tokens"

#   it "declares a winner if any column is marked by the same 3 tokens"

#   it "declares a winner if any diagonal is marked by the same 3 tokens"

#   it "declares a tie if all the spaces on the board are marked and no winner has been declared"

#   it "ends the game if there is a winner"

#   it "ends the game if there is a tie"

#   it "creates a TicTacToe board with specified dimensions"

#   it "prints out the board"

#   it "numbers spaces on the board 1-9 by default"

#   it "allows a player to mark the space on the board corresponding to an input 1-9 with their token"

#   it "prevents a space that has already been marked to be marked again"

#   it "it resets the a marked space to it's original number value"
#   it

end

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
      #will need to add this validation elsewhere
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

  it "creates a board with specified dimensions" do

    expect(board).to be_instance_of Board
  end

  it "allows a player to make a move on the board by inputing the number of a space " do

    board.set_move(1, "x")

    expect(board.read_move(1)).to eq("x")
  end

  it "prevents a space from being marked twice" do
    board.set_move(1,"x")

    expect(board.set_move(1,"o")).to eq("invalid move")
  end

  it "returns an array of available spaces" do
    board.set_move(1,"x")

    expect(board.available_spaces).to eq([2,3,4,5,6,7,8,9])
  end

  it "loops through the game sequence until the game is over"

  it "ends the game if all the spaces on the board are marked"

  it "declares a winner if any row is marked by the same 3 tokens"

  it "declares a winner if any column is marked by the same 3 tokens"

  it "declares a winner if any diagonal is marked by the same 3 tokens"

  it "declares a tie if all the spaces on the board are marked and no winner has been declared"

  it "ends the game if there is a winner"

  it "ends the game if there is a tie"

  it "creates a TicTacToe board with specified dimensions"

  it "prints out the board"

  it "numbers spaces on the board 1-9 by default"

  it "allows a player to mark the space on the board corresponding to an input 1-9 with their token"

  it "prevents a space that has already been marked to be marked again"

  it "it resets the a marked space to it's original number value"
  it

end

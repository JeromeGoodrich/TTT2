require "rspec"
require "game"
require "stringio"

class MyInputClass
  attr_accessor :move
end

describe Game do
  let(:output) { StringIO.new }
  let(:input) { MyInputClass.new }
  let(:game) { Game.new(input, output) }

  it 'should print \'Welcome to Tic Tac Toe\'' do
    game.run

    expect(output.string).to include("Welcome to Tic Tac Toe")
  end

  it 'should tell you game over' do
    game.run

    expect(output.string).to include("Game Over")
  end

  it 'should take an input of 1' do
    input.move = "1"

    game.run

    expect(output.string).to include("X|_|_\n_|_|_\n_|_|_\n")
  end

  it 'should take an input of 2' do
    input.move = "2"

    game.run

    expect(output.string).to include("_|X|_\n_|_|_\n_|_|_\n")
  end

  it 'should take an input of 3' do
    input.move = "3"

    game.run

    expect(output.string).to include("_|_|X\n_|_|_\n_|_|_\n")
  end

  it 'should take an input of 4' do
    input.move = "4"

    game.run

    expect(output.string).to include("_|_|_\nX|_|_\n_|_|_\n")
  end

  it 'should take an input of 5' do
    input.move = "5"

    game.run

    expect(output.string).to include("_|_|_\n_|X|_\n_|_|_\n")
  end

  it 'should take an input of 6' do
    input.move = "6"

    game.run

    expect(output.string).to include("_|_|_\n_|_|X\n_|_|_\n")
  end

  it 'should take an input of 7' do
    input.move = "7"

    game.run

    expect(output.string).to include("_|_|_\n_|_|_\nX|_|_\n")
  end

  it 'should take an input of 8' do
    input.move = "8"

    game.run

    expect(output.string).to include("_|_|_\n_|_|_\n_|X|_\n")
  end

  it 'should take an input of 9' do
    input.move = "9"

    game.run

    expect(output.string).to include("_|_|_\n_|_|_\n_|_|X\n")
  end

  it 'it should take multiple inputs' do
    input.move = "1"
    game.run
    input.move = "2"
    game.run

    expect(output.string).to include("X|O|_\n_|_|_\n_|_|_\n")
  end

  it "should fill the board" do
  input.move = 1
  while input.move <= 9
    game.run
    input.move +=1
  end

    expect(output.string).to include("X|O|X\nO|X|O\nX|O|X\n")
  end
end



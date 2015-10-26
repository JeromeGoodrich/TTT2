require "game"
require "board"
require "user_interface"
require "human_player"
require "computer_player"
require "stringio"

output = StringIO.new
board = Board.new
ui = UserInterface.new(output,board)
game = Game.new(ui)


# within the philosophy of TDD when does it make
# sense to write this file and production code?

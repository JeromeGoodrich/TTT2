class Game

  def initialize(input, output)
    @input = input
    @output = output
    @board = "_|_|_\n_|_|_\n_|_|_\n"
  end

  def run
    @output.print "Welcome to Tic Tac Toe"

      if @board.count("_").odd?
        if @input.move == "1"
          @board[0] = "X"
          @output.print @board
        elsif @input.move == "2"
          @board[(@input.move.to_i)] = "X"
          @output.print @board
        else
          @board[(@input.move.to_i - 1)*2] = "X"
          @output.print @board
        end
      else
        if @input.move == "1"
          @board[0] = "O"
          @output.print @board
        elsif @input.move == "2"
          @board[(@input.move.to_i)] = "O"
          @output.print @board
        else
          @board[(@input.move.to_i - 1)*2] = "O"
          @output.print @board
        end
      end

    @output.print "Game Over"
  end
end

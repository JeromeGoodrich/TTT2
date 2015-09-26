class Game

  def initialize(input, output)
    @input = input
    @output = output
  end

  def run
    @output.print "Welcome to Tic Tac Toe"


    if @input.move == "1"
      @output.print "X|_|_\n_|_|_\n_|_|_\n"
    end

    if @input.move == "2"
      @output.print "_|X|_\n_|_|_\n_|_|_\n"
    end

    if @input.move == "3"
      @output.print "_|_|X\n_|_|_\n_|_|_\n"
    end

    if @input.move == "4"
      @output.print "_|_|_\nX|_|_\n_|_|_\n"
    end

    if @input.move == "5"
      @output.print "_|_|_\n_|X|_\n_|_|_\n"
    end

    if @input.move == "6"
      @output.print "_|_|_\n_|_|X\n_|_|_\n"
    end

    if @input.move == "7"
      @output.print "_|_|_\n_|_|_\nX|_|_\n"
    end

    if @input.move == "8"
      @output.print "_|_|_\n_|_|_\n_|X|_\n"
    end

    if @input.move == "9"
      @output.print "_|_|_\n_|_|_\n_|_|X\n"
    end
    @output.print "Game Over"
  end
end

class UserInterface

  def initialize(output, board)
    @output = output
    @board = board
  end

  def greeting
    @output.print "Welcome to TicTacToe"
  end

  def player_number
    @output.print "how many players will be playing?"
  end

  def player_name
    @output.print "please type your name"
  end

  def get_user_input
    $stdin.gets.chomp
  end

  def which_token
    @output.print "would you like to play with x or o"
  end

  def prompt_move
    @output.print "Player 1, make your move"
  end

  def print_board
    @output.print "#{@board.read_move(1)}|#{@board.read_move(2)}|#{@board.read_move(3)}\n" +
                  "#{@board.read_move(4)}|#{@board.read_move(5)}|#{@board.read_move(6)}\n" +
                  "#{@board.read_move(7)}|#{@board.read_move(8)}|#{@board.read_move(9)}\n"
  end

  def computer_thinking
    @output.print "the computer is thinking..."
  end

  def invalid_move
    @output.print "invalid_move"
  end

  def game_over
    @output.print "The game is over. Goodbye!"
  end
end

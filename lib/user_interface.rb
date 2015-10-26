class UserInterface

  def initialize(output, board)
    @output = output
    @board = board
  end

  def print_message(message)
    puts message
  end

  def print_board(rows)
    (0...rows.size).each do |index1|
      (0...rows.size).each do |index2|
        print " #{ rows[index1][index2] } |"
        if index2 == rows[0].size - 1
          print "\n"
        end
      end
    end
  end

def get_input(prompt)
    puts prompt
    $stdin.gets.chomp
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

  def print_char(board, space)
    move = @board.read_move(space)
    return space if move.nil? else move
  end

  def print_board
    @output.print "#{print_char(@board, 1)}|#{print_char(@board, 2)}|#{print_char(@board, 3)}\n" +
                  "#{print_char(@board, 4)}|#{print_char(@board, 5)}|#{print_char(@board, 6)}\n" +
                  "#{print_char(@board, 7)}|#{print_char(@board, 8)}|#{print_char(@board, 9)}\n"
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

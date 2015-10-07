class ComputerPlayer

  attr_accessor :token, :best_move

  def winning_move(board, move)
    board.set_move(move, "x")
    someone_won = board.winning_row? || board.winning_column? || board.winning_diagonal?
    board.array_of_spaces[move - 1] = move
    return someone_won
  end

  def block_opponent(board,move)
    board.set_move(move, "o")
    someone_won = board.winning_row? || board.winning_column? || board.winning_diagonal?
    board.array_of_spaces[move - 1] = move
    return someone_won
  end

  def evaluate_board(board)
    if board.available_spaces == (1..9).to_a
      @best_move = 1
    elsif board.available_spaces.length == 1
      @best_move = board.available_spaces.first
    elsif board.available_spaces == [4,5,6,7,9]
      @best_move = 5
    else
      board.available_spaces.each do |space|
        if winning_move(board, space)
          @best_move = space
        end
      end
    end
  end
end




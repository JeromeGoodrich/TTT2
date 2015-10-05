class ComputerPlayer

  attr_accessor :token, :best_move

  WINNING_COMBOS = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]

  def winning_move(board, move)
    board.set_move(move, "x")
    someone_won = board.winning_column?
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




class ComputerPlayer

  attr_accessor :token, :best_move
require "pry"
  def score(board, depth)
    if (board.last_token_placed == token) && board.someone_won?
      return 10 - depth
    elsif (board.last_token_placed != token) && board.someone_won?
      return depth - 10
    elsif board.tie_game?
      return 0
    end
  end


  def evaluate_board(board, depth=0)
#binding.pry
    if board.game_over?
      return score(board,depth)
    end

    scores = {}
    if board.token != token
      best_val = 100
      board.available_spaces.each do |space|
        potential_board = board.set_move(space, board.token)
        val = evaluate_board(potential_board, depth + 1)
          if val < best_val
            best_val = val
          end
        board.reset_move(space)
        scores[space] = best_val
      end
    else
      best_val = -100
      board.available_spaces.each do |space|
        potential_board = board.set_move(space, board.token)
        val = evaluate_board(potential_board, depth + 1)
          if val > best_val
            best_val = val
          end
        board.reset_move(space)
        scores[space] = best_val
      end
    end

    if depth == 0
      return @best_move = scores.max_by { |key, value| value}[0]
    else
      return best_val
    end
  end
end




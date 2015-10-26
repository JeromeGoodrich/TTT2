class ComputerPlayer

  attr_accessor :token, :best_move, :name
require "pry"

  def score(board, depth)
    if board.someone_won == token
      return 10 - depth
    elsif token == "x" && board.someone_won == "o"
      return depth - 10
    elsif token == "o" && board.someone_won == "x"
      return depth - 10
    elsif board.tie_game?
      return 0
    end
  end

  def move(board, depth=0, alpha=-100, beta=100)
#binding.pry

    if board.game_over?
      return score(board,depth)
    end

    scores = {}
    if board.token != token
      best_val = 100
      board.available_spaces.each do |space|
        potential_board = board.set_move(space, board.token)
        val = move(potential_board, depth + 1)
          if val < best_val
            best_val = val
              if best_val < beta
                beta = best_val
                  if beta <= alpha
                    break
                  end
              end
          end
        board.reset_move(space)
        scores[space] = best_val
      end
    else
      best_val = -100
      board.available_spaces.each do |space|
        potential_board = board.set_move(space, board.token)
        val = move(potential_board, depth + 1)
          if val > best_val
            best_val = val
              if best_val > alpha
                alpha = best_val
                  if beta <= alpha
                    break
                  end
              end
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




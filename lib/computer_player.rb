class ComputerPlayer

  attr_accessor :token, :best_move

  def score(board, depth)
    if (board.last_token_placed == token) && board.someone_won?
      return 10 - depth
    elsif (board.last_token_placed != token) && board.someone_won?
      return depth - 10
    elsif board.tie_game?
      return 0
    end
  end

require "pry"
  def evaluate_board(board, depth=0)
#binding.pry
    if board.game_over?
      return score(board,depth)
    end

    if board.token != token
      best_val = 100
      board.available_spaces.each do |space|
        potential_board = board.set_move(space, board.token)
        val = evaluate_board(potential_board, depth + 1)
          if val < best_val
            best_val = val
          end
        board.reset_move(space)
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
      end
    end
    return @best_move = best_val
  end

#     if board.available_spaces == (1..board.size).to_a
#       @best_move = 1
#     elsif board.available_spaces.length == 1
#       @best_move = board.available_spaces.first
#     elsif board.available_spaces == [2,5,6,8,9]
#       @best_move = 9
#     elsif board.available_spaces == [4,5,6,8,9]
#       @best_move = 9
#     elsif board.available_spaces == [2,3,5,6,8]
#       @best_move = 3
#     elsif board.available_spaces == [4,5,6,7,8]
#       @best_move = 7
#     elsif board.available_spaces == [3,4,6,7,8]
#       @best_move = 7
#     else
#       board.available_spaces.each do |space|
#         if winning_move(board, space) || block_opponent(board, space)
#           @best_move = space
#         end
#       end
#     end
#   end

# private

#   def winning_move(board, move)
#     board.set_move(move, "x")
#     if board.someone_won?
#       return board.someone_won?
#     else
#       board.reset_move(move)
#       return false
#     end
#   end

#   def block_opponent(board, move)
#     board.set_move(move, "o")
#     if board.someone_won?
#       return board.someone_won?
#     else
#       board.reset_move(move)
#       return false
#     end
#   end
end




require "computer_player"

class Game

  def initialize(ui,player_selector,board)
    @ui = ui
    @player_selector = player_selector
    @board = board
  end

  def start_game
    @ui.print_message("Welcome to TicTacToe")
    number_of_players = @ui.get_input("How many players?")
    players = @player_selector.select(number_of_players)
    player1_name = @ui.get_input("What is your name player 1?")
      if number_of_players == 2
        player2_name = @ui.get_input("What is your name player 2?")
      end
    name_players(players,player1_name,player2_name)
    assign_token(players,"x","o")
    game_loop(players)
  end

  def game_loop(players)
    if @board.game_over?
      end_game
    else
      player = players.first
      #@ui.print_board
      move = get_move(player)
      @board.set_move(move, player.token)
      #@ui.print_board
      players = players.reverse
      game_loop(players)
    end
  end

  def name_players(players,player1_name="Human",player2_name="Computer")
    players[0].name = player1_name
    players[1].name = player2_name
  end

  def assign_token(players,player1_token,player2_token)
      players[0].token = player1_token
      players[1].token = player2_token
  end

  def end_game(players)
    if @board.someone_won
      players.each do |player|
        if player.token == @board.last_token_placed
          @ui.print_message("Game over! #{player.name} wins")
          exit
        end
      end
    elsif @board.tie_game
      @ui.print_message("Game over! It's a tie!")
      exit
    end
  end

  def get_move(player)
    #if player.name == "Computer"
      if @board.array_of_spaces.empty?
        rand(1,Math.sqrt(@board.size),@board.size - Math.sqrt(@board.size),@board.size)
      else
        player.move(@board,0,-100,100)
      end
    # else
    #   @ui.get_input("#{player.name}, please select a space on the board.")
    # end
  end

end

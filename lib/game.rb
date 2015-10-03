class Game

  def initialize(ui,player1,player2)
    @ui = ui
    @player1 = player1
    @player2 = player2
  end

  def run
    # @ui.greeting
    # number_of_players = @ui.player_number
    # players = create_players(number_of_players)
    # player1_name = @ui.player_name
    # player2_name = @ui.player_name
    # name_players(players,player1_name,player2_name)
    # player1_token = @ui.which_token
    # assign_token(players, player1_token, player2_token)
    # game_loop(players)
  end

  def game_loop(players)
    # if game_over?
    #   @ui.game_over
    #   exit
    # else
    #   player = players.first
    #   @ui.print_board
    #   move = @ui.make_move
    #   get_move(player, move)
    #   @board.set_move(player.move, player.token)
    #   @ui.print_board
    #   players = player.reverse
    #   game_loop(players)
    # end
  end

  def create_players(number_of_players)
    players = []
    if number_of_players == 2
      players << @player1
      players << @player2
    end
    return players
  end

  def name_players(players,player1_name,player2_name="Computer")
    players[0].name = player1_name
    players[1].name = player2_name
  end

  def assign_token(players,player1_token,player2_token="o")
    if player1_token == "o"
      player2_token = "x"
    end
    players[0].token = player1_token
    players[1].token = player2_token
  end

  def get_move(player,move)
    player.move = move
  end
end

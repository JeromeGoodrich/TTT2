class Game

  def initialize(ui,player1,player2)
    @ui = ui
    @player1 = player1
    @player2 = player2
  end

  def run
    @ui.greeting
    number = @ui.player_number
    create_players(number)
    name_players(players, player1_name, player2_name= "Player2")
    ui.assign_token
    assign_player_token()
    @ui.print_board
    @ui.make_move
    get_player_move(player, token)
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

  def assign_token(players,player1_token,player2_token)
    players[0].token = player1_token
    players[1].token = player2_token
  end

  def get_move(player,move)
    player.move = move
  end
end

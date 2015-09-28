class Game

  def initialize(output, input)
    @output = output
    @input = input
  end

  def run
    @output.print "welcome to ttt"

    @output.print "how many players will be playing?"

    @output.print "please type your name"

    @output.print "would you like to play with x or o"

    @output.print "Player 1, make your move"
  end


  def number_of_players(number)
    number
  end

  def create_players(number)
    player_array = []
    if number == 2
      @player1 == HumanPlayer.new
      @player2 == HumanPlayer.new
      player_array << @player1
      player_array << @player2
    end
  end
end

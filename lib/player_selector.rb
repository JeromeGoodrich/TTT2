require "human_player"

class PlayerSelector

  def select(number_of_players,human_player="HumanPlayer",computer_player="ComputerPlayer")
    players = []
    if number_of_players == 2
      players << create_player(human_player)
      players << create_player(human_player)
    elsif number_of_players == 1
      players << create_player(human_player)
      players << create_player(computer_player)
    elsif number_of_players == 0
      players << create_player(computer_player)
      players << create_player(computer_player)
    end
    return players
  end

  def create_player(player_type)
    Object.const_get(player_type).new
  end
end


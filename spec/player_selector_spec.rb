require "rspec"
require "player_selector"

describe PlayerSelector do
  let(:player_selector) {PlayerSelector.new}

  it "selects 2 human players for the game" do
    players = player_selector.select(2)

    expect(players[0]).to be_instance_of(HumanPlayer)
    expect(players[1]).to be_instance_of(HumanPlayer)
  end

  it "selects 1 human and 1 computer player for the game" do
    players = player_selector.select(1)

    expect(players[0]).to be_instance_of(HumanPlayer)
    expect(players[1]).to be_instance_of(ComputerPlayer)
  end

  it "selects 2 computer players for the game" do
    players = player_selector.select(0)

    expect(players[0]).to be_instance_of(ComputerPlayer)
    expect(players[1]).to be_instance_of(ComputerPlayer)
  end
end

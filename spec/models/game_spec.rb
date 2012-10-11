require 'spec_helper'

describe Game do
  describe "relations" do
    it "players" do
      game = Game.make!
      player = Player.make!
      GamePlayer.make!(game: game, player: player)
      game.players.count.should == 1
    end
  end
end
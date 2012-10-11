require 'spec_helper'

describe Game do
  describe "relations" do
    it "has players" do
      game = Game.make!
      player = Player.make!
      player_two = Player.make!
      GamePlayer.make!(game: game, player: player)
      GamePlayer.make!(game: game, player: player_two)
      GamePlayer.make!
      game.players.count.should == 2
    end
  end
end
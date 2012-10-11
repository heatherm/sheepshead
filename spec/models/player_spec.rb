require 'spec_helper'

describe Player do
  describe "relations" do
    it "games" do
      player = Player.make!
      game = Game.make!
      second_game = Game.make!
      GamePlayer.make!(player: player, game: game)
      GamePlayer.make!(player: player, game: second_game)
      player.games.should =~ [game, second_game]
    end
  end
end
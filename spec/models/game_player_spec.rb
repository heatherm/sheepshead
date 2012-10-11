require 'spec_helper'

describe GamePlayer do
  describe "relations" do
    before do
      @game = Game.make!
      @player = Player.make!
      @game_player = GamePlayer.make!(game: @game, player:@player)
    end

    it "has a player" do
      @game_player.player.should == @player
    end
    it "has a game" do
      @game_player.game.should == @game
    end
  end
end
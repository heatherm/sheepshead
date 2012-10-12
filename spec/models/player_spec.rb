require 'spec_helper'

describe Player do
  describe "relations" do
    it "games" do
      game = Game.make!
      game.players.first.games.first.should == game
    end
  end

  describe "hand" do
    it "should be an empty array on initialize" do
      Player.make!.hand.should == []
    end
  end
end
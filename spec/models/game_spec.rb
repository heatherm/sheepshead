require 'spec_helper'

describe Game do
  describe "relations" do
    it "has a deck" do
      game = Game.make
      game.deck.should_not be_nil
    end

    it "has 5 players" do
      Game.make!.players.count.should == 5
    end
  end
end
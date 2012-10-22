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

    it "should have a shuffled deck" do
      Game.make!.cards.first.should_not == Deck.data.first
    end

    it "has a round" do
      Game.make!.round.should == 1
    end

    it "has a dealer" do
      game = Game.make!
      game.dealer.username.should == "Player 1"
    end

    it "has a user" do
      Game.make!.user.should_not be_nil
    end

    it "has a turn" do
      Game.make!.turn.username.should == "Player 2"
    end

  end

  describe "advance_round" do
    it "should increment the round number by one" do
      Game.make!.advance_round.round.should == 2
    end

    it "should change the dealer" do
      Game.make!.advance_round.dealer.username.should == "Player 2"
    end
  end

  describe "deal" do
    before do
      @game = Game.make!
      @game.deal
    end

    it "should deal 6 cards to 5 players" do
      @game.players[1].stub(:go!)
      @game.players.each do |p|
        p.hand.count.should == 6
      end
    end

    it "should deal 2 cards to the blind" do
      @game.blind.count.should == 2
    end

    it "should redeal if deal was bad" do
      game = Game.make!
      game.stub(:redeal?).and_return(true)
      game.should_receive(:deal).once
      game.deal
    end

    context "redeal" do
      describe "redeal?" do

        it "should redeal when a player's hand has no aces, no face cards and no trump" do
          @game.players.each do |p|
            p.hand = []
          end
          @game.redeal?.should be_true
        end
      end
    end
  end
end
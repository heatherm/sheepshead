require 'spec_helper'

describe Game do
  describe "relations" do
    before do
      Game.any_instance.stub(:start_game_play)
      @game = Game.make!
    end

    it "has a deck" do
      @game.deck.should_not be_nil
    end

    it "has 5 players" do
      @game.players.count.should == 5
    end

    it "should have a shuffled deck" do
      @game.cards.first.should_not == Deck.data.first
    end

    it "has a round" do
      @game.round.should == 1
    end

    it "has a dealer" do
      @game.dealer.username.should == "Player 1"
    end

    it "has a user" do
      @game.user.should_not be_nil
    end

    it "has a turn" do
      @game.turn.username.should == "Player 2"
    end

    it "has a turn number" do
      @game.turn_number.should == 0
    end

    it "has a picker" do
      @game.picker.should_not be_nil
    end
  end

  describe "advance_round" do
    before do
      Game.any_instance.stub(:start_game_play)
    end

    it "should increment the round number by one" do
      Game.make!.advance_round.round.should == 2
    end

    it "should change the dealer" do
      Game.make!.advance_round.dealer.username.should == "Player 2"
    end
  end

  describe "deal" do
    before do
      Game.any_instance.stub(:start_game_play)
      @game = Game.make!
    end

    it "should deal 6 cards to 5 players no matter how many deals" do
      @game.deal
      @game.deal
      @game.players.each do |p|
        p.hand.count.should == 6
      end
    end

    it "should deal 2 cards to the blind" do
      @game.blind.count.should == 2
    end

    it "should redeal if deal was bad" do
      game = Game.make!
      game.should_receive(:empty_player_hands_and_blind)
      game.should_receive(:deal_three_to_each_player).twice
      game.should_receive(:deal_blind)
      game.should_receive(:redeal_needed?).once.and_return(false)
      game.deal
    end

    describe "redeal_needed?" do
      it "should redeal when a player's hand has no aces, no face cards and no trump" do
        @game.players.each do |p|
          p.hand = []
        end
        @game.redeal_needed?.should be_true
      end
    end
  end

  describe "find_a_picker" do
    before do
      Game.any_instance.stub(:start_game_play)
      @game = Game.make!
    end

    it "should assign a player as picker" do
      @game.find_a_picker
      @game.picker.should_not be_nil
    end
  end
end
require 'spec_helper'

describe Game do
  describe "relations" do

    it "players" do
      Game.make!.players.should_not be_nil
    end

    #it "tricks" do
    #  @game.tricks.should =~ [@trick]
    #end
  end

  describe "creation" do
    it "should create 5 players" do
      Game.make!
      #Player.count.should == 5
      #GamePlayer.count.should == 5
    end
  end
  #describe "advance_round" do
  #  before do
  #    Game.any_instance.stub(:start_game_play)
  #  end
  #
  #  it "should increment the round number by one" do
  #    Game.make!.advance_round.round.should == 2
  #  end
  #
  #  it "should change the dealer" do
  #    Game.make!.advance_round.dealer.username.should == "Player 2"
  #  end
  #end
  #
  #describe "deal" do
  #  before do
  #    Game.any_instance.stub(:start_game_play)
  #    @game = Game.make!
  #  end
  #
  #  it "should deal 6 cards to 5 players no matter how many deals" do
  #    @game.deal
  #    @game.deal
  #    @game.players.each do |p|
  #      p.hand.count.should == 6
  #    end
  #  end
  #
  #  it "should deal 2 cards to the blind" do
  #    @game.blind.count.should == 2
  #  end
  #
  #  it "should redeal if deal was bad" do
  #    game = Game.make!
  #    game.should_receive(:empty_player_hands_and_blind)
  #    game.should_receive(:deal_three_to_each_player).twice
  #    game.should_receive(:deal_blind)
  #    game.should_receive(:redeal_needed?).once.and_return(false)
  #    game.deal
  #  end
  #
  #  describe "redeal_needed?" do
  #    it "should redeal when a player's hand has no aces, no face cards and no trump" do
  #      @game.players.each do |p|
  #        p.hand = []
  #      end
  #      @game.redeal_needed?.should be_true
  #    end
  #  end
  #end
  #
  #describe "find_a_picker" do
  #  before do
  #    Game.any_instance.stub(:start_game_play)
  #    @game = Game.make!
  #  end
  #
  #  it "should assign a player as picker" do
  #    @game.find_a_picker
  #    @game.picker.should_not be_nil
  #  end
  #end
end
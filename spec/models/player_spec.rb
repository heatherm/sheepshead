# encoding: UTF-8
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

  describe "pick?" do
    it "should pick if the hand is strong" do
      #Generally, it is best not to pick up the blind unless the player has four or more trump in a five-handed game,
      #and it is best if at least one of those trump is a queen. Picking on three trump is unwise, unless they are very
      #highly powered cards.
      player = Player.make!
      player.hand = [
          Card.new({suit: :clubs, rank: :queen, value: 3, trump: true, trump_rank: 14}),
          Card.new({suit: :hearts, rank: :queen, value: 3, trump: true, trump_rank: 12}),
          Card.new({suit: :spades, rank: :jack, value: 2, trump: true, trump_rank: 9}),
          Card.new({suit: :hearts, rank: :jack, value: 2, trump: true, trump_rank: 8}),
          Card.new({suit: :spades, rank: :ace, value: 11, trump: false}),
          Card.new({suit: :hearts, rank: :nine, value: 0, trump: false})
      ]
      player.pick?.should be_true
    end

    it "should not pick if the hand is weak" do
      player = Player.make!
      player.hand = [
          Card.new({suit: :clubs, rank: :queen, value: 3, trump: true, trump_rank: 14}),
          Card.new({suit: :hearts, rank: :queen, value: 3, trump: true, trump_rank: 12}),
          Card.new({suit: :hearts, rank: :jack, value: 2, trump: true, trump_rank: 8}),
          Card.new({suit: :spades, rank: :ace, value: 11, trump: false}),
          Card.new({suit: :hearts, rank: :nine, value: 0, trump: false}),
          Card.new({suit: :hearts, rank: :eight, value: 0, trump: false})
      ]
      player.pick?.should be_false
    end

    it "should not pick if trump are little: J♣, J♦, A♦, 8♦, A♠, A♥" do
      #Don't take the blind. You have 4 trump, but they are mostly little. If you have a chronic picking problem you may pick on this.
      #If you pass on the blind, you have a very good chance of ending up partner, since you have 2 of the 3 fail aces.
      #This is a decent partner hand, with the trump and lots of point to "schmear" to your partner.
      player = Player.make!
      player.hand = [
          Card.new({suit: :clubs, rank: :jack, value: 2, trump: true, trump_rank: 10}),
          Card.new({suit: :diamonds, rank: :jack, value: 2, trump: true, trump_rank: 11}),
          Card.new({suit: :diamonds, rank: :ace, value: 11, trump: true, trump_rank: 6}),
          Card.new({suit: :diamonds, rank: :eight, value: 0, trump: true, trump_rank: 2}),
          Card.new({suit: :spades, rank: :ace, value: 11, trump: false}),
          Card.new({suit: :hearts, rank: :ace, value: 11, trump: false})
      ]
      player.pick?.should be_false
    end

    it "If you can forsee schneider, pick! Hand 3: Q♠, Q♥, 7♦, K♦, 10♥, 10♣" do
      #With 20 points to bury, this wouldn't be a bad hand to pick on.
      player = Player.make!
      player.hand = [
          Card.new({suit: :spades, rank: :queen, value: 3, trump: true, trump_rank: 13}),
          Card.new({suit: :hearts, rank: :queen, value: 3, trump: true, trump_rank: 12}),
          Card.new({suit: :diamonds, rank: :king, value: 4, trump: true, trump_rank: 4}),
          Card.new({suit: :diamonds, rank: :seven, value: 0, trump: true, trump_rank: 1}),
          Card.new({suit: :hearts, rank: :ten, value: 10, trump: false}),
          Card.new({suit: :clubs, rank: :ten, value: 10, trump: false})
      ]
      player.pick?.should be_true
    end
  end

  describe "bury" do
    it "should try to eliminate fail suits" do
      player = Player.make!
      player.hand = [
          Card.new({suit: :clubs, rank: :queen, value: 3, trump: true, trump_rank: 14}),
          Card.new({suit: :spades, rank: :queen, value: 3, trump: true, trump_rank: 13}),
          Card.new({suit: :hearts, rank: :queen, value: 3, trump: true, trump_rank: 12}),
          Card.new({suit: :hearts, rank: :jack, value: 2, trump: true, trump_rank: 8}),
          Card.new({suit: :hearts, rank: :nine, value: 0, trump: false}),
          Card.new({suit: :hearts, rank: :eight, value: 0, trump: false}),
          Card.new({suit: :spades, rank: :eight, value: 0, trump: false}),
          Card.new({suit: :clubs, rank: :eight, value: 0, trump: false})
      ]
      actual = player.bury.map{|card| "#{card.suit} - #{card.rank}"}
      actual.should =~ ["spades - eight", "clubs - eight"]
    end
    
    it "should keep at least one fail if it has one" do
      player = Player.make!
      player.hand = [
          Card.new({suit: :clubs, rank: :queen, value: 3, trump: true, trump_rank: 14}),
          Card.new({suit: :spades, rank: :queen, value: 3, trump: true, trump_rank: 13}),
          Card.new({suit: :hearts, rank: :queen, value: 3, trump: true, trump_rank: 12}),
          Card.new({suit: :diamonds, rank: :queen, value: 3, trump: true, trump_rank: 11}),
          Card.new({suit: :clubs, rank: :jack, value: 2, trump: true, trump_rank: 10}),
          Card.new({suit: :spades, rank: :jack, value: 2, trump: true, trump_rank: 9}),
          Card.new({suit: :hearts, rank: :jack, value: 2, trump: true, trump_rank: 8}),
          Card.new({suit: :clubs, rank: :eight, value: 0, trump: false})
      ]
      actual = player.bury.map{|card| "#{card.suit} - #{card.rank}"}
      actual.should =~ ["hearts - jack", "spades - jack"]
    end

    it "if you have high trump and a lot of them, you should try to bury points" do
      player = Player.make!
      player.hand = [
          Card.new({suit: :clubs, rank: :queen, value: 3, trump: true, trump_rank: 14}),
          Card.new({suit: :spades, rank: :queen, value: 3, trump: true, trump_rank: 13}),
          Card.new({suit: :hearts, rank: :queen, value: 3, trump: true, trump_rank: 12}),
          Card.new({suit: :diamonds, rank: :ace, value: 11, trump: true, trump_rank: 6}),
          Card.new({suit: :diamonds, rank: :ten, value: 10, trump: true, trump_rank: 5}),
          Card.new({suit: :diamonds, rank: :eight, value: 0, trump: true, trump_rank: 2}),
          Card.new({suit: :diamonds, rank: :seven, value: 0, trump: true, trump_rank: 1}),
          Card.new({suit: :clubs, rank: :eight, value: 0, trump: false})
      ]
      actual = player.bury.map{|card| "#{card.suit} - #{card.rank}"}
      actual.should =~ ["diamonds - ace", "diamonds - ten"]
    end

  end
end